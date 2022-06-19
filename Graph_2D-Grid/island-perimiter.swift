/*
LeetCode #463
Islands Perimeter
https://leetcode.com/problems/island-perimeter/
*/

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var grid = grid
        
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 1 {
                    return searchPerimeter(row, col, &grid)
                }
            }
        }
        
        return 0
    }
    
    func searchPerimeter(_ row: Int, _ col: Int, _ grid: inout [[Int]]) -> Int {
        // if out of bounds, return 1
        if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count {
            return 1
        }
        // if on water, return 1.
        if grid[row][col] == 0 {
            return 1
        }
        // check if cell has been visited
        if grid[row][col] == 2 {
            return 0
        }
        
        // mark current num as 2 to indicate visited
        grid[row][col] = 2
         
        let leftPerim   = searchPerimeter(row, col-1, &grid)
        let rightPerim  = searchPerimeter(row, col+1, &grid)
        let topPerim    = searchPerimeter(row-1, col, &grid)
        let bottomPerim = searchPerimeter(row+1, col, &grid)
        
        return leftPerim + rightPerim + topPerim + bottomPerim
    }
}