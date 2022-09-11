//
//  ViewController.swift
//  DataStrucure
//
//  Created by Gagandeep on 23/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // validateLinkedList()
        
        // validateStack()
        
        // validateQueue()
        
        validateTree()
    }

    
    private func validateLinkedList() {
        var list = LinkedList<Int>()

        list.push(value: 10)
        list.push(value: 22)

        list.show() // 22 -> 10
        list.append(value: 5)
        list.append(value: 2)

        list.show() // 22 -> 10 -> 5 -> 2
        list.insert(15, after: 1)

        list.show() // 22 -> 10 -> 15 -> 5 -> 2
        list.pop()

        list.show() // 10 -> 15 -> 5 -> 2
        list.removeLast()

        list.show() // 10 -> 15 -> 5
        list.remove(after: 0)

        list.show() // 10 -> 5
    }
    
    
    
    private func validateStack() {
        var nameStack = Stack()

        nameStack.push("Caleb")
        nameStack.push("Charles")
        nameStack.peek()
        nameStack.push("Tina")
        nameStack.pop()
        
        nameStack.push(1)
        nameStack.push(2)
        nameStack.push(3)
        nameStack.push("Tina 2")
        
        nameStack.printStack()
    }
    
    
    private func validateQueue() {
        var queue = Queue()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        _ = queue.dequeue()
        _ = queue.peek
        
        queue.printStack()
    }
    
    
    private func validateTree() {
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
        
        let tree = TreeNode("Beverages")
        tree.add(hot)
        tree.add(cold)
        
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
        
        
//        tree.depthFirstSearch { nodeValue in
//            print(nodeValue)
//        }
        
        
        tree.breadthFirstSearch { nodeValue in
            print(nodeValue)
        }
    }

}

