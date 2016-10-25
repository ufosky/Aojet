//
//  PromiseTests.swift
//  Aojet
//
//  Created by Qihe Bian on 10/23/16.
//  Copyright © 2016 Qihe Bian. All rights reserved.
//

import XCTest
@testable import Aojet

class PromiseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func testImmediatePromise() {
    do {
      let p = Promise<Int>(value: 2)
      let completeExpectation = self.expectation(description: "Immediate success")
      p.then { result in
        XCTAssert(result == 2)
        completeExpectation.fulfill()
      }
      waitForExpectations(timeout: 2, handler: nil)
    }
    do {
      let p = Promise<Int?>(value: nil)
      let completeExpectation = self.expectation(description: "immediate complete")
      p.then { result in
        XCTAssert(result == nil)
        completeExpectation.fulfill()
      }
      waitForExpectations(timeout: 2, handler: nil)
    }
    do {
      let p = Promise<Int?>(value: 2)
      let completeExpectation = self.expectation(description: "immediate complete")
      p.then { result in
        print(result)
        XCTAssert(result == 2)
        completeExpectation.fulfill()
      }
      waitForExpectations(timeout: 2, handler: nil)
    }
  }

}
