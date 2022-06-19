/*
LeetCode #242
Valid Anagram
https://leetcode.com/problems/valid-anagram/
*/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var hashMap1 = [String:Int]()
        var hashMap2 = [String:Int]()
        
        for char in s {
            let char = String(char)
            if hashMap1[char] != nil {
                hashMap1[char]! += 1
            } else {
                hashMap1[char] = 1
            }
        }
        
        for char in t {
            let char = String(char)
            if hashMap2[char] != nil {
                hashMap2[char]! += 1
            } else {
                hashMap2[char] = 1
            }
        }
        
        for (key, value) in hashMap1 {
            // check if the key in hm1 is NOT found in hm2
            if hashMap2[key] == nil { return false}
                        
            // check that key in both hashmaps have different values
            if hashMap1[key] != hashMap2[key] { return false }
        }
        
        return true
    }
}

