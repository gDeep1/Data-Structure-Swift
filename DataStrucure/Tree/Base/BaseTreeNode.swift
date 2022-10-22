//
//  BaseTreeNode.swift
//  DataStrucure
//
//  Created by Gagandeep on 20/10/22.
//

import UIKit

protocol TreeProtocol {
    func depthFirstSearch(completion: (_ nodeValue: Any)->())
    func breadthFirstSearch(completion: (_ nodeValue: Any)->())
}

class BaseTreeNode {
    var value: Any = "Empty Node"
    
    init() {
        
    }
    
    init(_ value: Any) {
        self.value = value
    }    
}
