//
//  MySortedSetTests.swift
//  MoviesAppSwiftUITests
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import XCTest
@testable import MoviesAppSwiftUI

final class MySortedSetTests: XCTestCase {
    
    var mySortedSet: MySortedSet<Int>?
    var myStringSortedSet: MySortedSet<String>?

    override func setUpWithError() throws {
        mySortedSet = MySortedSet(setArray: [])
        myStringSortedSet = MySortedSet(setArray: [])
    }

    override func tearDownWithError() throws {
        mySortedSet = nil
        myStringSortedSet = nil
    }
    
    func testInsertOneInteger() {
        mySortedSet?.insert(value: 10)
        XCTAssertEqual(mySortedSet?.setArray, [10])
    }
    
    func testInsertOneString() {
        myStringSortedSet?.insert(value: "Alex")
        XCTAssertEqual(myStringSortedSet?.setArray, ["Alex"])
    }
    
    func testInsertMultipleIntegers() {
        mySortedSet?.insert(values: [1,5,6,8,0])
        XCTAssertEqual(mySortedSet?.setArray, [0,1,5,6,8])
    }
    
    func testInsertMultipleStrings() {
        myStringSortedSet?.insert(values: ["Alex", "John", "Ben"])
        XCTAssertEqual(myStringSortedSet?.setArray, ["Alex", "Ben", "John"])
    }
    
    func testInsertDuplicateIntegers() {
        mySortedSet?.insert(values: [1,1,5,10,6,8])
        XCTAssertEqual(mySortedSet?.setArray, [1,5,6,8,10])
    }
    
    func testInsertDuplicateStrings() {
        myStringSortedSet?.insert(values: ["Alex", "John", "Alex", "Ben"])
        XCTAssertEqual(myStringSortedSet?.setArray, ["Alex", "Ben", "John"])
    }

    func testDeleteOneInteger() {
        mySortedSet?.insert(value: 10)
        mySortedSet?.delete(value: 10)
        XCTAssertEqual(mySortedSet?.setArray, [])
    }
    
    func testDeleteOneString() {
        myStringSortedSet?.insert(values: ["Alex", "John", "Ben"])
        myStringSortedSet?.delete(value: "Alex")
        XCTAssertEqual(myStringSortedSet?.setArray, ["Ben", "John"])
    }
    
    func testDeleteMultipleIntegers() {
        mySortedSet?.insert(values: [10, 60, 30, 45])
        mySortedSet?.delete(values: [30, 20])
        XCTAssertEqual(mySortedSet?.setArray, [10, 45, 60])
    }
    
    func testDeleteMultipleStrings() {
        myStringSortedSet?.insert(values: ["Alex", "John", "Ben", "Matt"])
        myStringSortedSet?.delete(values: ["Alex", "Ben"])
        XCTAssertEqual(myStringSortedSet?.setArray, ["John", "Matt"])
    }
    
    func testDeleteMissingInteger() {
        mySortedSet?.delete(value: 10)
        XCTAssertEqual(mySortedSet?.setArray, [])
        
        mySortedSet?.insert(values: [10, 20, 30, 45])
        mySortedSet?.delete(value: 50)
        XCTAssertEqual(mySortedSet?.setArray, [10, 20, 30, 45])
    }
    
    func testDeleteMissingString() {
        myStringSortedSet?.insert(values: ["Alex", "John", "Ben", "Matt"])
        myStringSortedSet?.delete(values: ["Siri"])
        XCTAssertEqual(myStringSortedSet?.setArray, ["Alex", "Ben", "John", "Matt"])
    }
    
    func testCountInteger() {
        XCTAssertEqual(mySortedSet?.getCount(), 0)
        mySortedSet?.insert(values: [10, 20, 30, 45])
        XCTAssertEqual(mySortedSet?.getCount(), 4)
    }
    
    func testCountString() {
        XCTAssertEqual(myStringSortedSet?.getCount(), 0)
        myStringSortedSet?.insert(values: ["Alex", "John", "Ben", "Matt"])
        myStringSortedSet?.delete(values: ["Matt"])
        XCTAssertEqual(myStringSortedSet?.getCount(), 3)
    }
}
