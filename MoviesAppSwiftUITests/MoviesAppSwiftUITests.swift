//
//  MoviesAppSwiftUITests.swift
//  MoviesAppSwiftUITests
//
//  Created by Laasya Priya vemuri on 9/30/26.
//


import XCTest
@testable import MoviesAppSwiftUI

// Problem Statement: Implement a stack
// Operations: Push, Pop

// Problem: SortedSet
// Implement Array as a Set - insert one element, insert multiple elements,
// Delete 1 ele, del multiple ele
// Return count


final class MoviesAppSwiftUITests: XCTestCase {
    
    var myStack: MyStack?

    override func setUpWithError() throws {
        myStack = MyStack(stack: [])
    }

    override func tearDownWithError() throws {
        myStack = nil
    }
    
    func testPush() {
        myStack?.push(value: 10)
        XCTAssertEqual(myStack?.stack, [10])
    }
    
    func testPop() {
        let poppedValue1 = myStack?.pop()
        XCTAssertEqual(poppedValue1, nil)
        
        myStack?.push(value: 10)
        let poppedValue2 = myStack?.pop()
        XCTAssertEqual(poppedValue2, 10)
    }

}
