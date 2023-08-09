//
//  DigimonListViewModel.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

enum ViewStates {
    case loading
    case errorState
    case loaded
    case emptyView
}

@MainActor //it is similar to work with DispatchQueue.main.async
class DigimonListViewModel: ObservableObject {
    
    @Published var digimonList: [Digimon] = []
    @Published var customError: NetworkError?
    @Published private(set) var viewStates: ViewStates = .loading
    
    var networkManager: NetworkAbleProtocol
    
    init(networkManager: NetworkAbleProtocol) {
        self.networkManager = networkManager
    }
    
    func getDigimonList (urlString: String) async  {
        viewStates = .loading

        guard let url = URL(string: urlString) else {
            viewStates = .errorState
            customError = .invalidUrlError
            return
        }
        
        let urlRequest = URLRequest(url: url)
        do {
            let data = try await networkManager.getDataFromApi(urlRequest: urlRequest)
            self.digimonList = try JSONDecoder().decode([Digimon].self, from: data)
            guard self.digimonList.isEmpty else {
                viewStates = .loaded
                return
            }
            viewStates = .emptyView
        }catch let error {
            viewStates = .errorState
            switch error {
            case is DecodingError:
                customError = NetworkError.parsingError
            case is URLError:
                customError = .invalidUrlError
            case NetworkError.dataNotFoundError:
                customError = NetworkError.dataNotFoundError
            case NetworkError.responseError:
                customError = NetworkError.responseError
            default:
                customError = .dataNotFoundError
            }
            print(error.localizedDescription)
        }
    }
    
}


class ViewmodelDuo: DigimonListViewModel {
    
}
