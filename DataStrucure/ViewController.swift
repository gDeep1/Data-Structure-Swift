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
        
        // TreeNode()
        //   .validate(depthFirstSearch: true)
        
         BinaryTreeNode()
            .validate(depthFirstSearch: false)
        
        // recursion()
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
        
        nameStack.printData()
    }
    
    
    private func validateQueue() {
        var queue = Queue()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        _ = queue.dequeue()
        _ = queue.peek
        
        queue.printData()
    }

    func recursion() {
        let recursion = Recursion()
        // Recursion().towerOfHanoi(disks: 4)
        // Recursion().towerOfHanoiWithAuxSpace(disks: 4)
        
        // var array = [220, 246, 277, 321, 454, 534, 565, 1127, 9331]
        // let isArraySorted = Recursion.isArraySorted(&array)
        // print("isArraySorted: \(isArraySorted)")
        
        // let bitStrings = Recursion.bitStrings(for: 3)
        // print("bitStrings: \(bitStrings)")
        
        let baseKStrings = recursion.baseKStrings(n: 4, k: 3)
        print("baseKStrings: \(baseKStrings)")
    }
}

