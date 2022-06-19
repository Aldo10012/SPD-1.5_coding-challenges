/*
LeetCode #160
Intersection of Two Linked Lists
https://leetcode.com/problems/intersection-of-two-linked-lists/
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val; self.next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var headA = headA
        var headB = headB
        
        let aLen = length(of: headA)
        let bLen = length(of: headB)
        
        var dif = aLen - bLen
        var AisLongerThanB: Bool = (dif > 0)
        
        //walk through the d distnace in the longer list
        for i in 0..<abs(dif) {
            if AisLongerThanB {
                headA = headA!.next
            } else {
                headB = headB!.next
            }
        }
        
        while headA != nil && headB != nil {
            if headA === headB {
                return headA
            }
            headA = headA!.next
            headB = headB!.next
        }
                
        return nil
    }
    
    private func length(of head: ListNode?) -> Int {
        if head == nil { return 0 }
        var current = head
        var len = 0
        
        while current != nil {
            current = current!.next
            len += 1
        }
        
        return len
    }
}