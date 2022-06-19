/*
LeetCode #21
Merge Two Sorted Lists 
https://leetcode.com/problems/merge-two-sorted-lists/
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val; self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var dummyNode: ListNode? = ListNode(0)
        
        // create pointers that point to heads of both lists
        var pointer1 = l1
        var pointer2 = l2
        
        
        while pointer1 != nil && pointer2 != nil {
            if pointer1!.val <= pointer2!.val {
                /// make new node with val aspointer1!.val
                let newNode = ListNode(pointer1!.val)
                /// insert new node with that value to dummyNode
                insert(node: newNode, toRoot: &dummyNode)
                /// move pointer
                pointer1 = pointer1?.next
            }
            else {
                /// make new node with val aspointer2!.val
                let newNode = ListNode(pointer2!.val)
                /// insert new node with that value to dummyNode
                insert(node: newNode, toRoot: &dummyNode)
                /// move pointer
                pointer2 = pointer2?.next
            }
        }
        
        /// if L1 is empty, insert the rest of L2 to dummy Node
        if pointer1 == nil {
            insert(node: pointer2, toRoot: &dummyNode)
        }
        /// if L2 is empty,  insert the rest of L1 to dummy Node
        if pointer2 == nil {
            insert(node: pointer1, toRoot: &dummyNode)
        }
        
        /// return dummyNode?.next, dummyNode.val is NOT in the original two lists
        return dummyNode?.next
        
    }
    
    func insert(node: ListNode?, toRoot root: inout ListNode?) {
        var current = root
        while current?.next != nil {
            current = current!.next
        }
        current?.next = node
    }
}