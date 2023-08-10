//
//  URLSession+Extension.swift
//  MVVMAPICallSwiftUI
//
//  Created by andres paladines on 8/9/23.
//

import Foundation

extension URLSession: NetworkManagersessionable {
    
    func getData(for urlRequest: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        try await self.data(for: urlRequest, delegate: delegate)
    }
        
}
