/*
LeetCode #653
Two Sum IV - Input is a BST
https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
*/

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
}


class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        // convert tree into sorted array - BFS, in-order
        let array = bsf(root)
        
        // two sum problem
        return arrHasTarget(array, k)
    }
    
    func bsf(_ root: TreeNode?) -> [Int] {
        // base case
        if root == nil { return [] }
        if root!.left == nil && root!.right == nil { return [root!.val] }
        
        var leftArr = [Int]()
        var rightArr = [Int]()
        
        if root?.left != nil {
            leftArr = bsf(root!.left)
        }
        if root?.right != nil {
            rightArr = bsf(root!.right)
        }
        
        return leftArr + [root!.val] + rightArr
    }
    
    func arrHasTarget(_ list: [Int], _ k: Int) -> Bool {
        var left = 0
        var right = list.count-1
        
        while left < right {
            let sum = list[left] + list[right]
            
            if sum == k {
                return true
            }
            else if sum > k {
                right -= 1
            } 
            else {
                left += 1
            }
        }
        
        return false        
    }
}