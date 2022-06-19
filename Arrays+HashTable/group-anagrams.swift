/*
LeetCode #49
Group Anagrams
https://leetcode.com/problems/group-anagrams/
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap = [String: [String]]()
        
        for str in strs {
            let sortedStr: String = String(str.sorted())
            
            if hashMap[sortedStr] != nil {
                hashMap[sortedStr]!.append(str)
            } else {
                hashMap[sortedStr] = [str]
            }            
        }
        
        var results: [[String]] = []
        for (key, value) in hashMap {
            results.append(value)
        }
        return results
    }
}