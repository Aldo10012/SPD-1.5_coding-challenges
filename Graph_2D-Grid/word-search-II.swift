/*
LeetCode #212
Word Search II
https://leetcode.com/problems/word-search-II/
*/

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var results = [String]()
        for row in (0..<board.count) {
            for col in (0..<board[row].count) {
                for word in words {
                    let currentChar = board[row][col]
                    let firstChar: Character = word.first!
                    
                    // if current char == the first char in word, search
                    if firstChar == currentChar && !results.contains(word) {
                        if search(row, col, board, word) {
                            results.append(word)
                        }
                    }
                }
            }
        }
        
        return results
    }
    
    /// DFS of matrix. Searches to see if matrix contains the word passed.
    func search(_ row: Int, _ col: Int, _ board: [[Character]], _ word: String) -> Bool {
        // if word is empty, then we already traversed thru entire word. return true
        if word == "" { return true }
        
        // verify that currentChar is INSIDE the bounds of board
        if row < 0 || col < 0 || row >= board.count || col >= board[row].count {
            return false
        }
        
        let currentChar: Character = board[row][col]
        let firstChar: Character = word.first! // first char of subString
        
        if currentChar != firstChar { return false }
        
        // make copy of board and assign current char as "-" to prevent double counting
        var board = board
        board[row][col] = "-"
        
        // search adjacent chars and pop first char from word
        let subString = String(word.dropFirst())
        let below = search(row+1, col, board, subString) // below
        let above = search(row-1, col, board, subString) // above
        let right = search(row, col+1, board, subString) // right
        let left  = search(row, col-1, board, subString) // left
        
        // if any one of these are true, return true, else return false
        return below || above || right || left
    }
    
}
