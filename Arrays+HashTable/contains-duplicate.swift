/*
LeetCode #217
Contains Duplicate
https://leetcode.com/problems/contains-duplicate/
*/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var mySet = Set<Int>()
        
        for num in nums {
            if mySet.contains(num) {
                return true
            }
            mySet.insert(num)
        }
        
        return false
    }
}