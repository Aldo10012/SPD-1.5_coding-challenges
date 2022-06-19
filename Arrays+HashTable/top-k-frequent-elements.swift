/*
LeetCode #347
Top K frequent Elements
https://leetcode.com/problems/top-k-frequent-elements/
*/


class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var hashMap: [Int: Int] = makeFrequencyCounter(from: nums)
        
        // setup results
        var results = [Int]()
        var k = k
        while k > 0 {
            var keyWithLargestValue: Int = 0
            var largestValue: Int = 0
            
            // get largest value
            for (key, value) in hashMap {
                if value > largestValue {
                    keyWithLargestValue = key
                    largestValue = value
                }
            }
            
            // add largestValue to results
            results.append(keyWithLargestValue)
            
            // set largestCount to -1, to prevent double counting
            hashMap[keyWithLargestValue] = -1
            k -= 1
        }
        
        return results
    }
    
    func makeFrequencyCounter(from nums: [Int]) -> [Int:Int] {
        var hashMap: [Int: Int] = [:]
        
        // setup hashMap
        for num in nums {
            // check if num is already stored in hashMap. if yes, update counter
            if hashMap[num] != nil {
                hashMap[num]! += 1
            }
            // if not, create new key-value pair
            else {
                hashMap[num] = 1
            }
        }
        
        return hashMap
    }
}