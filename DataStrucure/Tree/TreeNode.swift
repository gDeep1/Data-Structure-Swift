//
//  Tree.swift
//  DataStrucure
//
//  Created by Gagandeep on 24/08/22.
//

import Foundation

/// A single node is also a valid tree. So need to have another struct which would contain Parent node. New/further childrens would directly be added into childrens
class TreeNode: BaseTreeNode, TreeProtocol {
    var children:[TreeNode] = [TreeNode]()
    
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

extension TreeNode {
    private func createTree() -> TreeNode {
        let rootNode = TreeNode("Beverages")
        
        let hot = TreeNode("hot")
        let cold = TreeNode("cold")
        let tea = TreeNode("tea")
        let coffee = TreeNode("coffee")
        let cocoa = TreeNode("cocoa")
        let blackTea = TreeNode("black")
        let greenTea = TreeNode("green")
        let chaiTea = TreeNode("chai")
        let soda = TreeNode("soda")
        let milk = TreeNode("milk")
        let gingerAle = TreeNode("ginger ale")
        let bitterLemon = TreeNode("bitter lemon")
        
        rootNode.add(hot)
        rootNode.add(cold)
        
        hot.add(tea)
        hot.add(coffee)
        hot.add(cocoa)
        
        cold.add(soda)
        cold.add(milk)
        
        tea.add(blackTea)
        tea.add(greenTea)
        tea.add(chaiTea)
        
        soda.add(gingerAle)
        soda.add(bitterLemon)
        
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
