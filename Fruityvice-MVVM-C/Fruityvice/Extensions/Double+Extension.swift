//
//  Double+Extension.swift
//  Fruityvice
//
//  Created by andres paladines on 9/7/23.
//

import Foundation

extension Double {
    
    func toStringWith(decimal palces: Int) -> String {
        let decimals = String(palces)
        return String(format: "%.\(decimals)f", self)
    }
}
