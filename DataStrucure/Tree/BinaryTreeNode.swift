//
//  BinaryTreeNode.swift
//  DataStrucure
//
//  Created by Gagandeep on 20/10/22.
//

import UIKit

class BinaryTreeNode: BaseTreeNode, TreeProtocol {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    func setLeft(_ node: BinaryTreeNode) {
        left = node
    }
    
    func setRight(_ node: BinaryTreeNode) {
        right = node
    }
    
    func depthFirstSearch(completion: (Any) -> ()) {
        completion(value)
        
        /*
            Through recursion
         */
        
        if let leftNode = left {
            leftNode.depthFirstSearch(completion: completion)
        }
        
        if let rightNode = right {
            rightNode.depthFirstSearch(completion: completion)
        }
    }
    
    func breadthFirstSearch(completion: (Any) -> ()) {
        completion(value)
        
        var queue = Queue()
        
        if let leftNode = left {
            queue.enqueue(leftNode)
        }
        if let rightNode = right {
            queue.enqueue(rightNode)
        }
        
        /*
            Without recursion
         */
        
        while let item = queue.dequeue() as? BinaryTreeNode {
            completion(item.value)
            
            if let leftNode = item.left {
                queue.enqueue(leftNode)
            }
            if let rightNode = item.right {
                queue.enqueue(rightNode)
            }
        }
    }
}

extension BinaryTreeNode {
    private func createTree() -> BinaryTreeNode {
        let rootNode = BinaryTreeNode("Root")
        
        let hot = BinaryTreeNode("1")
        let cold = BinaryTreeNode("2")
        let tea = BinaryTreeNode("1.1")
        let coffee = BinaryTreeNode("1.2")
        let cocoa = BinaryTreeNode("1.3")
        let blackTea = BinaryTreeNode("1.1.1")
        let greenTea = BinaryTreeNode("1.1.2")
        let chaiTea = BinaryTreeNode("1.1.3")
        let soda = BinaryTreeNode("2.1")
        let milk = BinaryTreeNode("2.2")
        let gingerAle = BinaryTreeNode("2.1.1")
        let bitterLemon = BinaryTreeNode("2.1.2")
        
        rootNode.setLeft(hot)
        rootNode.setRight(cold)
        
        hot.setLeft(tea)
        hot.setRight(coffee)
        
        cold.setLeft(soda)
        cold.setRight(milk)
        
        tea.setLeft(blackTea)
        tea.setRight(greenTea)
        
        soda.setLeft(gingerAle)
        soda.setRight(bitterLemon)
        
        return rootNode
    }
    
    func validate(depthFirstSearch: Bool) {
        let tree = createTree()
        
        if depthFirstSearch {
            debugPrint("\n --- Depth First Search Start --- \n")
            
            tree.depthFirstSearch { nodeValue in
                debugPrint(nodeValue)
            }
            
            debugPrint("\n --- Depth First Search End --- \n")
        }
        else {
            debugPrint("\n --- Breadth First Search Start --- \n")
            tree.breadthFirstSearch { nodeValue in
                debugPrint(nodeValue)
            }
            
            debugPrint("\n --- Breadth First Search End --- \n")
        }
    }
}
