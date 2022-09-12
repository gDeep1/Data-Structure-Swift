//
//  Recursion.swift
//  DataStrucure
//
//  Created by Gagandeep on 11/09/22.
//

import Foundation

class Recursion {
    
    // MARK: - Puzzle
    // MARK: - Towars of Hanoi
    
    /// Solve Tower of Hanoi problem using auxiliary space
    /// - Parameters:
    ///   - disks: number of disks
    ///   - source: source tower
    ///   - destination: destination tower
    ///   - aux: middle tower through which disks would shuffle
    func towerOfHanoiWithAuxSpace(disks: Int, source: Int = 1, destination: Int = 3, aux: Int = 2) {
        guard disks > 0 else {
            return
        }
        
        towerOfHanoiWithAuxSpace(disks: disks - 1, source: source, destination: aux, aux: destination)
        print("Move:: disk \(disks) from \(source) to \(destination)")
        towerOfHanoiWithAuxSpace(disks: disks - 1, source: aux, destination: destination, aux: source)
    }
    
    /// Solve Tower of Hanoi problem
    /// - Parameters:
    ///   - disks: number of disks
    ///   - source: source tower
    ///   - destination: destination tower
    func towerOfHanoi(disks: Int, source: Int = 1, destination: Int = 3) {
        guard disks > 0 else {
            return
        }
        
        towerOfHanoi(disks: disks - 1, source: source, destination: 6-source-destination)
        print("Move:: disk \(disks) from \(source) to \(destination)")
        towerOfHanoi(disks: disks - 1, source: 6-source-destination, destination: destination)
    }
}
