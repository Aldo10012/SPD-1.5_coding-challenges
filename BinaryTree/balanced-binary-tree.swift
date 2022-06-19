/*
LeetCode #110
Balanced Binary Tree
https://leetcode.com/problems/balanced-binary-tree/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        var leftHeight: Int = 0
        var rightHight: Int = 0
        
        // find left and right height
        if root.left != nil {
            leftHeight = findHeight(root.left)
        }
        if root.right != nil {
            rightHight = findHeight(root.right)
        }
        
        // find difference
        let difference = abs(leftHeight - rightHight)
        
        // check if tree is unbalanced
        if difference > 1 {
            return false
        } 
        
        // return true if both left and right are also balanced
        return isBalanced(root.left) && isBalanced(root.right)
    }
    
    func findHeight(_ root: TreeNode?) -> Int {        
        // set default values
        var leftHeight = 0
        var rightHeight = 0
        
        if root?.left != nil {
            // get height of left subtree
            leftHeight = findHeight(root?.left)
        }
        if root?.right != nil {
            // get height of right subtree
            rightHeight = findHeight(root?.right)
        }
        
        return 1 + max(leftHeight, rightHeight)
    }
}