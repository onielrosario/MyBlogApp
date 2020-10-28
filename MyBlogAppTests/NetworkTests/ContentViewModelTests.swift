//
//  ContentViewModelTests.swift
//  AimeIOSChallengeTests
//
//  Created by Oniel Rosario on 10/20/20.
//

import XCTest
import SwiftUI
@testable import MyBlogApp

// how do we know this class is conformed?
// can save to favorites?
//can retrieve data?

class ContentViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SUT_InitializesSuccessfully() {
        let sut = FeedViewModel()
        XCTAssertNotNil(sut)
    }
    
    func test_SUT_Data() {
      
    }
}
