//
//  NetworkTests.swift
//  AimeIOSChallengeTests
//
//  Created by Oniel Rosario on 10/16/20.
//

import XCTest
@testable import MyBlogApp

// can we test the endpoint?
// can we add different object on the endpoint?

class NetworkTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // TODO: INITIALIZE Mock Network
        
    }
    
    override func tearDownWithError() throws {
        //       sut = nil
    }
    
    struct ANYJSONFILE: Codable {
        
    }
    
    func test_loadData_SuccessfulResponse() {
        let session = MockNetwork()
        let manager = NetworkManager<[PhotoModel]>(session: session)
        let exp = expectation(description: "I got data")
        let url = Endpoint.mock
        let mockJSON =  """
                        [{
                        "id": "1",
                        "alt_description": "2",
                        "urls": {
                              "regular": "3",
                              "small": "4",
                              "thumb": "5"
                        }}]
            """
        let data = Data(mockJSON.utf8)
        session.data = data
        let test = [PhotoModel(
                        id: "1",
                        altDescription: "2",
                        urls: URLS(
                            regular: "3",
                            small: "4",
                            thumb: "5"))]
        manager.loadData(endpoint: url) { (result) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.first?.id, test.first?.id)
                XCTAssertEqual(response.first?.urls.regular, test.first?.urls.regular)
                XCTAssertEqual(url, Endpoint.mock)
                exp.fulfill()
            case .failure(let err):
                XCTFail("error: \(err)")
            }
        }
        wait(for: [exp], timeout: 2.0)
    }
    
    
    func test_endpoint() {
        let session = MockNetwork()
        let manager = NetworkManager<[PhotoModel]>(session: session)
        let exp = expectation(description: "I got data")
        let url = Endpoint.photos
        let data = Data([1,0,1,0])
        session.data = data
        manager.loadData(endpoint: url) { (result) in
                XCTAssertEqual(url, Endpoint.photos)
                exp.fulfill()
        }
        wait(for: [exp], timeout: 2.0)
    }
}
