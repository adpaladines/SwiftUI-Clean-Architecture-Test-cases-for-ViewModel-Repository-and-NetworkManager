
//
//  FruitsNetworkManagerTest.swift
//  FruityviceTests
//
//  Created by Andres D. Paladines on 7/12/23.
//

import XCTest
@testable import Fruityvice
// moking -> Creating an array and obtain the information from it (creating data and putting the data in the class)
// stubbing -> When getting the data from JSON or an moked api
// faking ->

final class FruitsNetworkManagerTest: XCTestCase {

    var dummyFruitViewModel: FruitListViewModel!
    var jm: JsonManager!
    
    override func setUpWithError() throws {
        jm = JsonManager()
        dummyFruitViewModel = FruitListViewModel(networkManager: jm)
    }
    
    override func tearDownWithError() throws {
        dummyFruitViewModel = nil
        jm = nil
    }
    
    func testFruitAPICallWithCorrectData() throws {
        XCTAssertNotNil(dummyFruitViewModel)
        
        let extectation = expectation(description: "Fetching the list of fruits from API")
        let delay = 1.0
        
        dummyFruitViewModel.fetchDataWithProtocol(urlString: "fruits")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            XCTAssertNotNil(self.dummyFruitViewModel.fruitsList)
            XCTAssertEqual(self.dummyFruitViewModel.fruitsList!.count, 42)
            let firstFruit = self.dummyFruitViewModel.fruitsList!.first
            XCTAssertEqual(firstFruit?.name, "Persimmon")
            XCTAssertEqual(firstFruit?.family, "Ebenaceae")
            XCTAssertEqual(firstFruit?.genus, "Diospyros")
            XCTAssertEqual(firstFruit?.order, "Rosales")
            extectation.fulfill()
        }
        
        wait(for: [extectation], timeout: delay)
    }
        
    func testFruitAPICall_WhenUrlIsNotProvided() throws {
        XCTAssertNotNil(dummyFruitViewModel)
        let extectation = expectation(description: "Fetching the list of fruits from API and checking when URL is not provided")
        let delay = 1.0
        
        dummyFruitViewModel.fetchDataWithProtocol(urlString: "badUrl")
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            XCTAssertNil(self.dummyFruitViewModel.fruitsList)
            extectation.fulfill()
        }
        
        wait(for: [extectation], timeout: delay)
    }

    func testFruitJSONCallWithCorrectData() throws {
        XCTAssertNotNil(dummyFruitViewModel)
        
        let extectation = expectation(description: "Fetching the list of fruits from Mock JSON")
        let getAll = Api.shared.getAll
        let web = Api.shared.base
        let urlString = web+getAll
        let delay = 0.2
        dummyFruitViewModel.fetchDataWithProtocol(urlString: "fruits")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            XCTAssertNotNil(self.dummyFruitViewModel.fruitsList)
            XCTAssertEqual(self.dummyFruitViewModel.fruitsList!.count, 42)
            let firstFruit = self.dummyFruitViewModel.fruitsList!.first
            XCTAssertEqual(firstFruit?.name, "Persimmon")
            XCTAssertEqual(firstFruit?.family, "Ebenaceae")
            XCTAssertEqual(firstFruit?.genus, "Diospyros")
            XCTAssertEqual(firstFruit?.order, "Rosales")
            extectation.fulfill()
        }
        
        wait(for: [extectation], timeout: delay)
    }
    
    func testFruitJSONCallWithEmptyData() throws {
        XCTAssertNotNil(dummyFruitViewModel)
        
        let extectation = expectation(description: "Fetching the list of fruits from API and checking when doenst provide data")
        let delay = 0.5
        dummyFruitViewModel.fetchDataWithProtocol(urlString: "empty")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            XCTAssertNotNil(self.dummyFruitViewModel.fruitsList)
            XCTAssertEqual(self.dummyFruitViewModel.fruitsList!.count, 0)
            let firstFruit = self.dummyFruitViewModel.fruitsList!.first
            XCTAssertNil(firstFruit)
            extectation.fulfill()
        }
        
        wait(for: [extectation], timeout: delay)
    }
    
    
    func testPerformanceExample() throws {

        self.measure {
            
        }
    }

}
