/*
LeetCode #100
Same Tree
https://leetcode.com/problems/same-tree/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p?.val != q?.val { return false }
        if p == nil && q == nil { return true }
        if p == nil && q != nil { return false }
        if q == nil && p != nil { return false }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}