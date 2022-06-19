/*
LeetCode #226
Invert Binary Tree
https://leetcode.com/problems/invert-binary-tree/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        
        let leftCopy = root?.left
        let rightCopy = root?.right
        
        root?.left = rightCopy
        root?.right = leftCopy
        
        invertTree(root?.left)
        invertTree(root?.right)
        
        return root
    }
}