/*
LeetCode #101
Symmetric Tree
https://leetcode.com/problems/symmetric-tree/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return checkSemantic(root?.left, root?.right)
    }
    
    private func checkSemantic(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        if leftNode == nil && rightNode == nil { return true }
        if leftNode != nil && rightNode == nil { return false }
        if leftNode == nil && rightNode != nil { return false }
        
        if leftNode?.val != rightNode?.val {
            return false
        }
        
        return checkSemantic(leftNode?.left, rightNode?.right) && checkSemantic(leftNode?.right, rightNode?.left)
    }
}