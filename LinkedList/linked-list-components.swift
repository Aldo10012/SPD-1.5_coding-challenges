/*
LeetCode #817
LinkedList Component
https://leetcode.com/problems/linked-list-components/
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val; self.next = nil
    }
}


class Solution {
    func numComponents(_ head: ListNode?, _ nums: [Int]) -> Int {
        var currentNode: ListNode? = head
        var numberOfConections: Int = 0
        var isConnected: Bool = false
        
        while currentNode != nil {
            let val = (currentNode?.val)!
            
            if nums.contains(val) {
                print("Is connected")
                if !isConnected {
                    isConnected = true
                    numberOfConections += 1
                }
            } else {
                print("Is not connected")
                isConnected = false
            }
            currentNode = currentNode?.next
        }
        
        return numberOfConections
    }
}