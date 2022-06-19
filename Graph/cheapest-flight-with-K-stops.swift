/*
LeetCode #463
Cheapest Flights within K Stops
https://leetcode.com/problems/cheapest-flights-within-k-stops/
*/


struct Edge {
    let src: Int
    let dest: Int
    let price: Int
}

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var hashMap = makeHashMap(from: flights)
        var visited = Set<Int>()
        var queue = [(Int,Int, Int)]()
        //           city, price, k_so_far
        
        var cheapestFlight: Int = Int.max
        
        // set starting point
        queue.append((src, 0, 0))
        
        while !queue.isEmpty {
            let currentCity = queue[0].0        // get first city in queue
            let currentPrice = queue[0].1       // get price needed to get to current city
            let currentK = queue[0].2           // get k so far
            visited.insert(currentCity)
            queue.remove(at: 0)                   // drop first city form queue
            
            if currentCity == dst {
                if currentPrice < cheapestFlight {
                    cheapestFlight = currentPrice
                }
            }
            
            
            print(hashMap[currentCity])
            
            // check for steps so far
            if currentK == k+1 {
                continue
            }
            
            if let edges = hashMap[currentCity] { // unwrape edges
                for edge in edges { // traverse neighbors
                    if !visited.contains(edge.dest) { // check if dest was not visited
                        queue.append((edge.dest, currentPrice + edge.price, currentK + 1))
                    }
                }
            }
        }
        
        return cheapestFlight == Int.max ? -1 : cheapestFlight
    }
    
    func makeHashMap(from flights: [[Int]]) -> [Int:[Edge]]{
        var result = [Int:[Edge]]()
        for flight in flights {
            let edge = Edge(src: flight[0], dest: flight[1], price: flight[2])
            
            if result[flight[0]] != nil {
                result[flight[0]]?.append(edge)
            } else {
                result[flight[0]] = [edge]
            }
        }
        return result
    }
}