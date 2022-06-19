/*
LeetCode #617
Merge Two Binary Trees
https://leetcode.com/problems/merge-two-binary-trees/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}

class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil && root2 == nil { return nil }
        
        var newRoot: TreeNode?
        if root1 != nil && root2 != nil {
            newRoot = TreeNode(root1!.val + root2!.val)
            
            newRoot?.left = mergeTrees(root1?.left, root2?.left)
            newRoot?.right = mergeTrees(root1?.right, root2?.right)
        }
        
        if root1 == nil && root2 != nil {
            newRoot = TreeNode(root2!.val)
            
            newRoot?.left = mergeTrees(nil, root2?.left)
            newRoot?.right = mergeTrees(nil, root2?.right)
            
        }
        if root1 != nil && root2 == nil {
            newRoot = TreeNode(root1!.val)
            
            newRoot?.left = mergeTrees(root1?.left, nil)
            newRoot?.right = mergeTrees(root1?.right, nil)
            
        }
        
        return newRoot
    }
}