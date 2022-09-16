//
//  LinkedList.swift
//  DataStrucure
//
//  Created by Gagandeep on 14/09/22.
//

import Foundation

// ************** Linked List ************ //
/*
 Source: https://medium.com/geekculture/linked-lists-in-swift-5-69ba9748f4b6
 
 Advantages Over Array:
    1. Insertion at any location (except end) takes O(1) time only. Array takes O(n) time always (for shifting the elements) (except end).
 
*/

class Node<T> {
    var value: T // generic value
    var next: Node<T>? //stores reference to next object
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList <T> {
    var head: Node<T>?      // first node of the list
    var tail: Node<T>?      // last node of the list // It is created for convinience only. By default, it does not exist in standard Link list. It helps to reduce access time for last node.
    
    
    // MARK: INSERTION
    
    /// Insert new node from front of the list
    mutating func push(value: T) {
        head = Node(value: value, next: head) // it would be inserted from front. So it would become head of the list.
        
        if tail == nil {
            tail = head
        }
    }
    /// Insert new node from bottom of the list
    mutating func append(value: T) {
        let node = Node(value: value)
        
        tail?.next = node // set ref of new node from current tail node.
        tail = node // replace tail with new node.
    }
    
    /// Insert after perticular index
    /// - Parameters:
    ///   - value: value
    ///   - index: index number
    func insert(value: T, at index: Int) {
        var currentIndex = 0
        var currentHead = self.head
        
        while currentIndex < index {
            currentHead = currentHead?.next
            currentIndex += 1
        }
        
        let newNode = Node(value: value, next: currentHead?.next)
        currentHead?.next = newNode
    }
    
    /// Insert after perticular index
    /// - Parameters:
    ///   - value: value
    ///   - index: index number
    func insert(_ value: T, after index: Int) {
        guard let node = nodeAt(index) else { return }
        
        node.next = Node(value: value, next: node.next)
    }
    
    
    
    // MARK: RETRIEVAL
    
    /// Get node at index
    /// - Parameter index: index number
    /// - Returns: node
    func nodeAt(_ index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentHead = self.head
        
        while currentHead != nil, currentIndex < index {
            currentHead = currentHead?.next
            currentIndex += 1
        }
        
        return currentHead
    }
    
    
    // MARK: Deletion
    
    @discardableResult
    mutating func pop() -> T? {
        defer {
            // remove current head
            head = head?.next // assign next node as new head
        }
        
        // return value before removal
        return head?.value
    }
    
    @discardableResult
    mutating func remove(after index: Int) -> T? {
        guard let node = nodeAt(index) else { return nil }
        
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    
    /// Remove last node
    /// - Returns: Node value
    @discardableResult
    mutating func removeLast() -> T? {
        guard let head = head else { return nil }
        guard head.next != nil else { return pop() }
        
        var previousNode = head
        var currentNode = head
        
        while let next = currentNode.next {
            previousNode = currentNode
            currentNode = next
        }
        
        previousNode.next = nil
        tail = previousNode
        
        return currentNode.value
    }
    
    
    /// Delete all elements from linked list
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
    
    
    // MARK: Utility Functions
    
    func show() {
        print("------- Start Print LinkedList ---------")
        
        var currentHead = head
        while currentHead != nil {
            print("\(currentHead?.value) -> ")
            currentHead = currentHead?.next
        }
        
        print("< List end > \n\n")
    }
}


