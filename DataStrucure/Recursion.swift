//
//  Recursion.swift
//  DataStrucure
//
//  Created by Gagandeep on 11/09/22.
//

import Foundation

class Recursion {
    
    // MARK: - Array
    
    /// Check if array is sorted
    /// - Parameter array: list of array
    /// - Returns: true if list is sorted
    class func isArraySorted(_ array: inout [Int]) -> Bool {
        if array.count == 1 { return true }
        let isSmall = array[0] <= array[1]
        array.removeLast()
        return isSmall && isArraySorted(&array)
    }
    
    /// Append List of bits with intial bit
    /// - Parameters:
    ///   - initialBit: 0/1
    ///   - list: list of bits
    /// - Returns: list of strings
    private func appendListOfBits(with initialBit: String, _ list: [String]) -> [String] {
        return list.map({initialBit+$0})
    }
    
    /// Get all possible binary codes for given number of bits
    /// - Parameter n: number of bits
    /// - Returns: list of binary strings
    class func bitStrings(for numberOfBits: Int) -> [String] {
        if numberOfBits == 0 { return [] }
        if numberOfBits == 1 { return ["0", "1"] }
        
        let listOfBinaryCodesWhereFirstBitIsZero = Recursion().appendListOfBits(with: "0", bitStrings(for: numberOfBits-1)) // It would take T(n-1) time
        let listOfBinaryCodesWhereFirstBitIsOne = Recursion().appendListOfBits(with: "1", bitStrings(for: numberOfBits-1)) // It would take T(n-1) time
    
        // so total T(n) = 2(T(n-1)) for n > 0
        
        return (listOfBinaryCodesWhereFirstBitIsZero + listOfBinaryCodesWhereFirstBitIsOne)
    }
    
    /// Get list of strings from 0 to k-1
    /// - Parameter k: range end point
    /// - Returns: list of strings
    private func rangeToList(_ k: Int) -> [String] {
        var result = [String]()
        for i in 0..<k {
            result.append("\(i)")
        }
        return result
    }
    
    /// Base K Strings
    /// - Parameters:
    ///   - n: number of sets
    ///   - k: range starting from from 0
    /// - Returns: list of n times all strings that fall in range k.
    func baseKStrings(n: Int, k: Int) -> [String] {
        if n == 0 { return [] }
        if n == 1 { return rangeToList(k) } // It would take T(k) time
        
        let digit = baseKStrings(n: 1, k: k) // As k is constant, It would take T(1) time
        let bitstring = baseKStrings(n: n-1, k: k) // It would take T(n-1) time
        
        // so total time = k*(T(n-1))
        return digit + bitstring
    }
    
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
