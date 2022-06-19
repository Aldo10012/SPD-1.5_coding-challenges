/*
LeetCode #234
palindrome LinkedList
https://leetcode.com/problems/palindrome-linked-list/
*/

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val; self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while fast?.next !=  nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        var firstHalf = head
        var secondHalf = reverseList(slow)
    
        while secondHalf != nil {
            if firstHalf?.val != secondHalf?.val {
                return false
            }
            firstHalf = firstHalf?.next
            secondHalf = secondHalf?.next
        }
        return true
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var currentNode = head
        var nextNode: ListNode? = head!.next
        var previous: ListNode? = nil
                
        while currentNode != nil {
            currentNode!.next = previous
            
            previous = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }
        
        return previous
    }
    
}

var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(1)
node1.next = node2
node2.next = node3

let s = Solution()
s.isPalindrome(node1)