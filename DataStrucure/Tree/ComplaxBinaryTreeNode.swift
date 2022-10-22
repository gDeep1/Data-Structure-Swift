//
//  ComplaxBinaryTreeNode.swift
//  DataStrucure
//
//  Created by Gagandeep on 20/10/22.
//

import UIKit

@propertyWrapper
struct ComplaxBinaryTreeChildren {
    var list: [ComplaxBinaryTreeNode] = []
    
    var wrappedValue: [ComplaxBinaryTreeNode] {
        get {
            if list.count > 1 {
                return [list[0], list[1]]
            }
            else if list.count > 0 {
                return [list[0]]
            }
            return []
        }
        set {
            // last item would be latest item inserted in trees
            if let last = newValue.last {
                // no more than 2 children
                guard list.count < 2 else {
                    // discard items more than 2
                    return
                }
                
                list.append(last)
            }
        }
    }
    
    init(wrappedValue list: [ComplaxBinaryTreeNode]) {
        self.list = list
    }
}


class ComplaxBinaryTreeNode: BaseTreeNode, TreeProtocol {
    @ComplaxBinaryTreeChildren var children: [ComplaxBinaryTreeNode] = []
    
    func add(_ child: ComplaxBinaryTreeNode) {
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
        while let child = queue.dequeue() as? ComplaxBinaryTreeNode {
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

extension ComplaxBinaryTreeNode {
    private func createTree() -> ComplaxBinaryTreeNode {
        let rootNode = ComplaxBinaryTreeNode("Root")
        
        let hot = ComplaxBinaryTreeNode("1")
        let cold = ComplaxBinaryTreeNode("2")
        let tea = ComplaxBinaryTreeNode("1.1")
        let coffee = ComplaxBinaryTreeNode("1.2")
        let cocoa = ComplaxBinaryTreeNode("1.3")
        let blackTea = ComplaxBinaryTreeNode("1.1.1")
        let greenTea = ComplaxBinaryTreeNode("1.1.2")
        let chaiTea = ComplaxBinaryTreeNode("1.1.3")
        let soda = ComplaxBinaryTreeNode("2.1")
        let milk = ComplaxBinaryTreeNode("2.2")
        let gingerAle = ComplaxBinaryTreeNode("2.1.1")
        let bitterLemon = ComplaxBinaryTreeNode("2.1.2")
        
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
