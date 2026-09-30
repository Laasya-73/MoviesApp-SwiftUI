//
//  mySortedSet.swift
//  MoviesAppSwiftUI
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import Foundation

// Problem: SortedSet
// Implement Array as a Set - insert one element, insert multiple elements,
// Delete 1 ele, del multiple ele
// Return count


struct MySortedSet<T: Comparable>  {
    var setArray: [T]
    
    mutating func insert(value: T) {
        guard !setArray.contains(value) else {
            return
        }
        setArray.append(value)
        setArray.sort()
    }
    
    mutating func insert(values: [T]) {
        for value in values {
            insert(value: value)
        }
    }
    
    mutating func delete(value: T) {
        guard let indexOfValue = setArray.firstIndex(of: value) else {
            return
        }
        setArray.remove(at: indexOfValue)
    }
    
    mutating func delete(values: [T]) {
        for value in values {
            delete(value: value)
        }
    }
    
    mutating func getCount() -> Int {
       setArray.count
    }
}
