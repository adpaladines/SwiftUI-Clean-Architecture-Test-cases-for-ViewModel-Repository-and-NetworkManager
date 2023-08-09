//
//  DigimonViewModelUnitTests.swift
//  MVVMAPICallSwiftUITests
//
//  Created by Andres D. Paladines on 7/19/23.
//

import XCTest
@testable import MVVMAPICallSwiftUI

//nil value type vars
//null reference type vars
final class DigimonViewModelUnitTests: XCTestCase {

    var viewModel: DigimonListViewModel!
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
        
    }

    func testDigimonList_WhenWeExpectCorrectData() async throws {
        let nm = JsonManager()
        viewModel = await DigimonListViewModel(networkManager: nm)
        
        await viewModel.getDigimonList(urlString: "digimonList")
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 209)
        
        let error = await viewModel.customError
        XCTAssertNil(error)
        
        let firstDigi = digiList.first
        XCTAssertEqual(firstDigi?.name, "Koromon")
        XCTAssertEqual(firstDigi?.name, "In Training")
        XCTAssertEqual(firstDigi?.name, "Koromon")

    }
    
    func testDigimonList_WhenWeHaveInvalidURL() async throws {
        let nm = JsonManager()
        viewModel = await DigimonListViewModel(networkManager: nm)
        
        await viewModel.getDigimonList(urlString: "")
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 209)
        
        let error = await viewModel.customError
        XCTAssertNil(error)
        
        let firstDigi = digiList.first
        XCTAssertEqual(firstDigi?.name, "Koromon")
        XCTAssertEqual(firstDigi?.name, "In Training")
        XCTAssertEqual(firstDigi?.name, "Koromon")

    }
    
    func testDigimonList_WhenWeExpectNoData() async throws {
        let nm = JsonManager()
        viewModel = await DigimonListViewModel(networkManager: nm)
        
        await viewModel.getDigimonList(urlString: "")
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 0)
        
        let error = await viewModel.customError
        XCTAssertEqual(error, NetworkError.invalidUrlError)
    }

    func testDigimonList_WhenWeExpectParsingError() async throws {
        let nm = JsonManager()
        viewModel = await DigimonListViewModel(networkManager: nm)
        
        await viewModel.getDigimonList(urlString: "digimonIncorrectData")
        let digiList = await viewModel.digimonList
        XCTAssertEqual(digiList.count, 0)
        
        let error = await viewModel.customError
        XCTAssertEqual(error, NetworkError.parsingError)
    }
    
    func testDigimonList_WhenWeExpectResponseError() async throws {
        let nm = JsonManager()
        viewModel = await DigimonListViewModel(networkManager: nm)
        let newError = NSError(domain: "Error Response", code: 500, userInfo: ["info": "Bad Response"])
        await viewModel.getDigimonList(urlString: "digimonIncorrectData")
        let digiList = await viewModel.digimonList
        
        XCTAssertEqual(digiList.count, 0)
        let error = await viewModel.customError
        XCTAssertEqual(error, NetworkError.responseError)
    }
    
    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
