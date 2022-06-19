/*
LeetCode #141
LinkedList Cycle
https://leetcode.com/problems/linked-list-cycle/
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val; self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head?.next
        var slow = head
        
        while (fast != nil && fast?.next != nil && slow != nil) {
            if fast === slow {
                return true
            }
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return false
    }    
}