/*
LeetCode #207
Course Schedule
https://leetcode.com/problems/course-schedule/
*/

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var hashMap = createHashMap(from: prerequisites)
        var visited = Set<Int>()
        
        func canCompleteCourse(_ course: Int) -> Bool {
            if visited.contains(course) { // if we've already visited this course, loop found!
                return false
            }
            if hashMap[course] == [] { // if course has no prereqs, it can for sure be completed
                return true
            }

            visited.insert(course)
            if let listOfPrereqs = hashMap[course] {
                for prereq in listOfPrereqs {
                    if !canCompleteCourse(prereq) {
                        return false
                    }
                }
            }

            visited.remove(course)
            hashMap[course] = []
            return true
        }
        
        
        for course in 0...numCourses {
            if !canCompleteCourse(course) {
                return false
            }
        }
                
        return true
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
