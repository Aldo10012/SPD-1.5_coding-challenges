/*
LeetCode #200
Number of Islands
https://leetcode.com/problems/number-of-islands/
*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var numberOfIslands: Int = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == "1" {
                    numberOfIslands += 1
                    search(row, col, &grid)
                }
            }
        }
        
        return numberOfIslands
    }
    
    func search(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
        // varify base case
        if row < 0 || col < 0 || row > grid.count-1 || col > grid[0].count-1 {
            return // stop search if out of bounds
        }
        
        if grid[row][col] == "0"  {
            return // stop search if grid[row][col] is water "0"
        }
        
        // update value to 0 to prevent double counting
        grid[row][col] = "0"
        
        // check neighbors
        search(row, col-1, &grid) // search up
        search(row, col+1, &grid) // search down
        search(row-1, col, &grid) // search left
        search(row+1, col, &grid) // search right
    }
}