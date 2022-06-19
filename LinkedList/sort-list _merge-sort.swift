/*
LeetCode #148
Sort List
https://leetcode.com/problems/sort-list/
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val; self.next = nil
    }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        // base case
        if head == nil { return nil }
        if head?.next == nil { return head }
        
        // split list in half
        var left = head
        var right = getMid(from: head)
        var temp = right?.next
        right?.next = nil
        right = temp

        // sort each side
        left = sortList(left)
        right = sortList(right)
        
        // merge left and right
        let mergedList = merge2Lists(left, right)
        
        return mergedList
    }
    
    func getMid(from head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var slow = head, fast = head?.next
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    func merge2Lists(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
        if head1 == nil && head2 == nil {return nil}
        if head1 == nil {return head2}
        if head2 == nil {return head1}
        
        var pointer1 = head1
        var pointer2 = head2
        
        var result: ListNode? = ListNode(0)
        var tail: ListNode? = result
        
        while pointer1 != nil && pointer2 != nil {
            if pointer1!.val < pointer2!.val {
                tail?.next = ListNode(pointer1!.val)
                tail = tail?.next
                pointer1 = pointer1?.next
            } else {
                tail?.next = ListNode(pointer2!.val)
                tail = tail?.next
                pointer2 = pointer2?.next
            }
        }
        
        if pointer1 != nil { tail?.next = pointer1 }
        if pointer2 != nil { tail?.next = pointer2 }
        
        return result?.next
    }
}