/*
LeetCode #23
Merge K Sorted Lists 
https://leetcode.com/problems/merge-k-sorted-lists/
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val; self.next = nil
    }
}


class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        var result: ListNode? = lists[0]
        
        for i in 0..<lists.count-1 {
            result = merge2Lists(result, lists[i+1])
        }
        
        return result
    }
    
    func merge2Lists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil { return nil }
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        var result: ListNode? = ListNode(0)
        var tail = result
        
        var pointer1 = list1
        var pointer2 = list2
        
        while pointer1 != nil && pointer2 != nil {
            if pointer1!.val < pointer2!.val {
                let newNode = ListNode(pointer1!.val)
                tail?.next = newNode
                tail = tail?.next
                pointer1 = pointer1?.next
                
            } else {
                let newNode = ListNode(pointer2!.val)
                tail?.next = newNode
                tail = tail?.next
                pointer2 = pointer2?.next
            }
        }
        
        if pointer1 != nil {
            tail?.next = pointer1
        }
        if pointer2 != nil {
            tail?.next = pointer2
        }
        
        return result?.next
    }
}