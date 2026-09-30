//
//  myQueue.swift
//  MoviesAppSwiftUI
//
//  Created by Laasya Priya vemuri on 9/30/26.
//

import Foundation

struct MyQueue {
    var queue: [Int]
    
    mutating func enqueue(value: Int) {
        queue.append(value)
    }
    
    mutating func dequeue() -> Int? {
        guard queue.count > 0 else {
            return nil
        }
        return queue[0]
    }
}
