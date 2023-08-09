//
//  FruitDetailsWikiViewController.swift
//  Fruityvice
//
//  Created by andres paladines on 8/7/23.
//

import UIKit
import WebKit

class FruitDetailsWikiViewController: UIViewController {

    var selectedItem: Fruit? = nil
    var selectedColor: UIColor? = nil
    
    @IBOutlet weak var wikiWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    func setWebView() {
        guard
            let fruit = selectedItem,
            let url = URL(string: Api.shared.wikiSearch+fruit.name)
        else {
            return
        }
        
        wikiWebView.navigationDelegate = self
        let request = URLRequest(url: url)
        wikiWebView.load(request)
    }

}

extension FruitDetailsWikiViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading!")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy {
        guard let host = webView.url?.host(), host == "en.m.wikipedia.org" else {
            return .cancel
        }
        return .allow
    }
    
}
