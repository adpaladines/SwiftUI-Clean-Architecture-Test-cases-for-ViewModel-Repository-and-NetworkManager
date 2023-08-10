//
//  Request.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/9/23.
//

import Foundation

protocol Requestable {
    
    var baseURL: String { get }
    var path: String { get }
    var type: String { get } // get, post, put, delete, etc.
    func createURLRequest() -> URLRequest?
    
}

extension Requestable {
    
    var baseURL: String {
        return APIEndPoint.baseUrl
    }
    var type: String {
        return ""
    }
    var header: [String:String] {
        return [:]
    }
    var params: [String: String] {
        return [:]
    }

    func createURLRequest () -> URLRequest? {
        guard baseURL.isNotEmpty, path.isNotEmpty else  {
            return nil
        }
        
        var urlComponents = URLComponents(string: baseURL + path)
        var queryItems: [URLQueryItem] = []
        params.forEach { key, value in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else {
            return nil
        }
        return URLRequest(url: url)
    }
    
}
