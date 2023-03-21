//
//  UserSettingsDemoTests.swift
//  UserSettingsDemoTests
//
//  Created by Eshan Singh on 17/03/23.
//

import XCTest
@testable import UserSettingsDemo

final class UserSettingsDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConcurrentUsage() {
        let concurrentQueue = DispatchQueue(label: "concurrentQueue" , attributes: .concurrent)
        let expectation =  expectation(description: "Using UserSettings.shared from multiple threads shall succeed")
        let callcount = 100
        for callIndex in 1...callcount {
            concurrentQueue.async {
                UserSettings.shared.set(forKey: String(callIndex), value: callIndex)
            }
        }
        while UserSettings.shared.int(forKey: String(callcount)) != callcount {
            //
        }
        expectation.fulfill()
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Test expectation failed")
            
        }
    }

}
