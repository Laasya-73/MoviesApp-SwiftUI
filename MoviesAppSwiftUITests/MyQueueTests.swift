//
//  MyQueueTests.swift
//  MoviesAppSwiftUITests
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import XCTest
@testable import MoviesAppSwiftUI

final class MyQueueTests: XCTestCase {
    var myQueue: MyQueue?

    override func setUpWithError() throws {
        myQueue = MyQueue(queue: [])
    }

    override func tearDownWithError() throws {
        myQueue = nil
    }

    func testEnqueue() {
        myQueue?.enqueue(value: 5)
        XCTAssertEqual(myQueue?.queue, [5])
    }
    
    func testDequeue() {
        let dequeuedValue1 = myQueue?.dequeue()
        XCTAssertEqual(dequeuedValue1, nil)
        
        myQueue?.enqueue(value: 15)
        let dequeuedValue2 = myQueue?.dequeue()
        XCTAssertEqual(dequeuedValue2, 15)
    }
}
