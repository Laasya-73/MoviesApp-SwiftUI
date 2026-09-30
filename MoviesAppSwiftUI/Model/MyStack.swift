//
//  myStack.swift
//  MoviesAppSwiftUI
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import Foundation

struct MyStack {
    var stack: [Int]
    
    mutating func push(value: Int) {
        stack.append(value)
    }
    
    mutating func pop() -> Int? {
        guard stack.count > 0 else {
            return nil
        }
        return stack[stack.count - 1]
    }
}
