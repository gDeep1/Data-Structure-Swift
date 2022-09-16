//
//  Classes.swift
//  DataStrucure
//
//  Created by Gagandeep on 23/08/22.
//

import Foundation

// MARK: STACK

// ************** Stack ************ //
/*
 Source: https://medium.com/devslopes-blog/swift-data-structures-stack-4f301e4fa0dc
*/

struct Stack {
    private var items: [Any] = [Any]()
    
    /// Print stack
    func printStack() {
        let topDivider = "--- Stack Start ---\n"
        let bottomDivider = "\n----- Stack End ------\n"
        
        print(topDivider)
        
        for item in items {
            print(item)
        }
        
        print(bottomDivider)
    }
    
    /// Push item in stack from top
    mutating func push(_ item: Any){
        items.insert(item, at: 0)
    }
    
    /// Pop
    @discardableResult
    mutating func pop() -> Any? {
        return items.removeFirst()
    }
    
    /// Get top item
    @discardableResult
    func peek() -> Any? {
        return items.first
    }
}


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
    
    // Print stack
    func printStack() {
        let topDivider = "--- Queue Start ---\n"
        let bottomDivider = "\n----- Queue End ------\n"
        
        print(topDivider)
        
        for item in items {
            print(item)
        }
        
        print(bottomDivider)
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
