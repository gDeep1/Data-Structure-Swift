//
//  Tree.swift
//  DataStrucure
//
//  Created by Gagandeep on 24/08/22.
//

import Foundation


/// A single node is also a valid tree. So need to have another struct which would contain Parent node. New/further childrens would directly be added into childrens
class TreeNode {
    var value: Any
    var children:[TreeNode] = [TreeNode]()
    
    init(_ value: Any, children: [TreeNode]? = nil) {
        self.value = value
        if let list = children {
            self.children = list
        }
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
    
    func depthFirstSearch(completion: (_ nodeValue: Any)->()) {
        // traverse parent node first
        completion(self.value)
        // traverse left/first child node and repeat for right child after traversing all lefts first
        children.forEach { child in
            child.depthFirstSearch(completion: completion)
        }
    }
    
    func breadthFirstSearch(completion: (_ nodeValue: Any)->()) {
        // traverse parent node first
        completion(self.value)
        
        // put all children in a queue
        var queue = Queue()
        children.forEach { child in
            queue.enqueue(child)
        }
        
        // traverse each child from queue one by one.
        while let child = queue.dequeue() as? TreeNode {
            // traverse current child node first
            completion(child.value)
            // check subchilds of child
            child.children.forEach { furtherChild in
                // put them in the end of same queue and traverse back to next child of upper level.
                queue.enqueue(furtherChild)
            }
        }
    }
}
