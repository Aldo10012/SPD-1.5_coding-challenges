/*
LeetCode #98
Validate Binary Search Tree
https://leetcode.com/problems/validate-binary-search-tree/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}


class Solution {
    func isValidBST(_ root: TreeNode?, _ min: Int = Int.min, _ max: Int = Int.max) -> Bool {
        guard let root = root else { return true }
        
        if (min >= root.val || root.val >= max) {
            return false
        }
        
        let leftIsValid = isValidBST(root.left, min, root.val)
        let rightIsValid = isValidBST(root.right, root.val, max)
        
        return leftIsValid && rightIsValid
    }    
}