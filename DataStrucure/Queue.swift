//
//  Queue.swift
//  DataStrucure
//
//  Created by Gagandeep on 23/08/22.
//

import Foundation

// MARK: QUEUE

// ************** Queue ************ //
/*
 Source: https://medium.com/devslopes-blog/swift-data-structures-stack-4f301e4fa0dc
*/

struct Queue {
    
    private var items: [Any] = [Any]()
    
    var peek: Any? {
        items.first
    }
    
    mutating func enqueue(_ item: Any) {
        items.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> Any? {
        defer {
            if !items.isEmpty {
                items.removeFirst()
            }
        }
        return items.first
    }
}

extension Queue {
    // Print stack
    func printData() {
        let topDivider = "--- Queue Start ---\n"
        let bottomDivider = "\n----- Queue End ------\n"
        
        print(topDivider)
        
        for item in items {
            print(item)
        }
        
        print(bottomDivider)
    }
}
