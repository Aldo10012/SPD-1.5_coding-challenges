/*
LeetCode #1
Two Sum
https://leetcode.com/problems/two-sum/
*/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for index1 in 0..<nums.count{
            for index2 in 0..<nums.count{
                if index1 != index2{
                    if nums[index1] + nums[index2] == target{
                        return [index1, index2]
                    }
                }
            }
        }
        
        return []
    }
}
