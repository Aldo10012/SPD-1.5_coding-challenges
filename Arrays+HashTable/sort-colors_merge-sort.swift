/*
LeetCode #75
Sort Colors
https://leetcode.com/problems/sort-colors/
*/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        nums = sortArray(nums)
    }
    
    func sortArray(_ array: [Int]) -> [Int] {
        // base cases
        guard array.count > 1 else {
            return array
        }
        
        // split array in hald
        let mid: Int = (array.count/2)
        var lefthalf: [Int] = Array(array[0..<mid])
        var righthalf: [Int] = Array(array[mid..<array.count])
        
        // sort each half
        lefthalf = sortArray(lefthalf)
        righthalf = sortArray(righthalf)
        
        // merge the two
        let mergedArray: [Int] = merge(arr1: lefthalf, arr2: righthalf)
        return mergedArray
    }
    
    func merge(arr1: [Int], arr2: [Int]) -> [Int] {
        var merged = [Int]()
        var arr1 = arr1
        var arr2 = arr2
        
        // while loop
        while !arr1.isEmpty && !arr2.isEmpty {
            if arr1[0] > arr2[0] {
                merged.append(arr2.removeFirst())
            } else {
                merged.append(arr1.removeFirst())
            }
        }
        
        // final cases
        merged = merged + arr1 + arr2
        
        return merged
    }
}
