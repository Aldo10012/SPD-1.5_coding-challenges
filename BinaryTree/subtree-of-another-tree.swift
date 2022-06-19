/*
LeetCode #572
Subtree of another Tree
https://leetcode.com/problems/subtree-of-another-tree/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}


class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root?.val == subRoot?.val {
            if isSameTree(root, subRoot) {
                return true
            }
        }
        
        var leftHasSubTree: Bool = false
        var rightHasSubTree: Bool = false
        
        if root?.left != nil {
            leftHasSubTree = isSubtree(root?.left, subRoot)
        }
        if root?.right != nil {
            rightHasSubTree = isSubtree(root?.right, subRoot)
        }
        
        // as long as one returns true, then tree has subTree
        return leftHasSubTree || rightHasSubTree        
    }
    
    // checks if two given trees are the same
    func isSameTree(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil { return true }
        if root1 != nil && root2 == nil { return false }
        if root1 == nil && root2 != nil { return false }
        
        if root1?.val == root2?.val {
            return isSameTree(root1?.left, root2?.left) && isSameTree(root1?.right, root2?.right)
        }
        
        return false
    }
}