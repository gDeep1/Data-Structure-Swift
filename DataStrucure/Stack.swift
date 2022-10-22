//
//  Stack.swift
//  DataStrucure
//
//  Created by Gagandeep on 20/10/22.
//

import UIKit

// MARK: STACK

// ************** Stack ************ //
/*
 Source: https://medium.com/devslopes-blog/swift-data-structures-stack-4f301e4fa0dc
*/

struct Stack {
    private var items: [Any] = [Any]()
    
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

extension Stack {
    /// Print stack
    func printData() {
        let topDivider = "--- Stack Start ---\n"
        let bottomDivider = "\n----- Stack End ------\n"
        
        print(topDivider)
        
        for item in items {
            print(item)
        }
        
        print(bottomDivider)
    }
}
