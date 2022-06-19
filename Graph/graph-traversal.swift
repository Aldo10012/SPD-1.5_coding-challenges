import Foundation

/**
 
 Objectives
 ✅ DFS - Depth First Search
 ✅ BFS - Breadth First Search

 
 */

class Node {
    public var id: Int
    public var neighbors: [Node]
    public init(_ id: Int) {
        self.id = id; self.neighbors = []
    }
}


class Graph {
    // key:   Node.id
    // value: the actual Node
    private var hashMap: [Int: Node] = [:]
    
    func getHashMap() -> [Int:Node] {
        return hashMap
    }
    
    func addNode(_ id: Int) -> Void {
        // if node doesn't exist yet, add to hash map. If it does, ignore this
        if hashMap[id] == nil {
            hashMap[id] = Node(id)
        } else {
            print("attempting to add a node that already exists")
        }
    }
    
    func getNode(_ val: Int) -> Node? {
        return hashMap[val]
    }
    
    func addEdge(source: Int, destination: Int) -> Void {
        // make sure both source and destination are in the hashMap. If not, exit.
        guard let sNode = getNode(source), let dNode = getNode(destination) else {
            return
        }
        sNode.neighbors.append(dNode)
    }
    
    
    // MARK: - DFS
    func hasPathDFS(source: Int, destination: Int) -> Bool {
        // if either source or desgination are NOT in hashMap, return nil b/c there IS NO PATH
        guard let sNode = getNode(source), let dNode = getNode(destination) else { return false }
        
        // create set to keep track of what nodes we've already visited.
        var visited = Set<Int>()
        
        return dfs(source: sNode, destination: dNode, visited: &visited)
    }
    
    private func dfs(source: Node, destination: Node, visited: inout Set<Int>) -> Bool {
        // mark current node as visited
        visited.insert(source.id)
        
        // check if our current node (source) is the destination. If yes, return true
        if source === destination { return true }
        
        // recursively check each of the neighbor nodes that has NOT BEEN VISITED
        for neighbor in source.neighbors {
            if !visited.contains(neighbor.id) {
                let isFound = dfs(source: neighbor, destination: destination, visited: &visited)
                if isFound == true { return isFound }
            } else {
                print("\(neighbor.id) has already been visited")
            }
        }
        
        return false
    }
    
    
    // MARK: - BFS
    func hasPathBFS(source: Int, destination: Int) -> Bool {
        // if either source or desgination are NOT in hashMap, return nil b/c there IS NO PATH
        guard let sNode = getNode(source), let dNode = getNode(destination) else { return false }
        
        return bfs(source: sNode, destination: dNode)
    }
    
    
    func bfs(source: Node, destination: Node) -> Bool {
        
        // create queue to keep track of nodes in queue to be visited
        var queue: [Node] = [source]
        
        // create set to keep track of nodes already visited
        var visited = Set<Int>()
        
        while !queue.isEmpty {
            // dequeue first node in queue, set currentNode as the node just dequeued
            let currentNode = queue.remove(at: 0)
            
            // check if this node is the destination. If yes, return true
            if currentNode === destination { return true }
            
            // check if current node has been visited, no nothing
            if visited.contains(currentNode.id) { }
            
            // mark currentNode as visited
            visited.insert(currentNode.id)
            
            // enqueue neighboring nodes (if they weren't visited yet)
            for neighbor in currentNode.neighbors {
                if !visited.contains(neighbor.id) {
                    queue.append(neighbor)
                }
            }
        }
                
        return false
    }
}



var g = Graph()
g.addNode(0)
g.addNode(1)
g.addNode(2)
g.addNode(3)
g.addNode(4)
g.addNode(5)

g.addEdge(source: 5, destination: 0)
g.addEdge(source: 0, destination: 1)
g.addEdge(source: 0, destination: 2)
g.addEdge(source: 1, destination: 0)
g.addEdge(source: 1, destination: 2)
g.addEdge(source: 1, destination: 4)
g.addEdge(source: 4, destination: 1)
g.addEdge(source: 3, destination: 4)


g.hasPathDFS(source: 4, destination: 0)
g.hasPathDFS(source: 4, destination: 1)
g.hasPathDFS(source: 4, destination: 2)
g.hasPathDFS(source: 4, destination: 3)
g.hasPathDFS(source: 4, destination: 4)
g.hasPathDFS(source: 4, destination: 5)
