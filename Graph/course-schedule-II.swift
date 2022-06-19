/*
LeetCode #210
Course Schedule II
https://leetcode.com/problems/course-schedule-ii/
*/

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var hashMap = createHashMap(from: prerequisites)
        var visitSet = Set<Int>()
        var cycleSet = Set<Int>()
        var result = [Int]()
        
        func dfs(_ course: Int) -> Bool {
            if cycleSet.contains(course) {
                return false
            }
            if visitSet.contains(course) {
                return true
            }
            
            cycleSet.insert(course)
            if let prerequisites = hashMap[course] {
                for prereq in prerequisites {
                    if !dfs(prereq) {
                        return false
                    }
                }
            }
            cycleSet.remove(course)
            visitSet.insert(course)
            result.append(course)
            
            return true
        }
        
        for course in 0..<numCourses {
            if !dfs(course) {
                return []
            }
        }
        
        return result
    }
    
    func createHashMap(from prerequisites: [[Int]]) -> [Int: [Int]] {
        var hashMap: [Int: [Int]] = [:]
        
        for course in prerequisites {
            let cours = course[0]
            let prereq = course[1]
            
            if hashMap[cours] != nil {
                hashMap[cours]?.append(prereq)
            } else {
                hashMap[cours] = [prereq]
            }
        }
        
        return hashMap
    }
}