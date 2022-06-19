import Foundation

/*
 
 VOCAB:
 - Vertex - (node) the fundamental unit of a graph
 - Edge   - a connection between two verticies
 - Weight - shows the cost of an edge
 - Path   - a sequence of verticies connected by edges
 - Cycle  - when a path ends where it began
 
 - directed graph   - where wach edge has a direction
 - undirected graph - where each edge is NOT directional. or could just be bidirectional
 
 Ways to implement graph:
 Edge List:
 - Store a list of all edges in the graph. This method is easy to store, but much harder to retrieve data & reason about the graph.

 Adjacency Matrix:
 - Store a matrix (or 2D array) of all vertices mapped to all vertices. Two vertices i, j have an edge between them if matrix[i][j] == 1. This method is more space-intensive to store, but quick to look up an edge.

 Adjacency List (preferred):
 - Store a list of vertices, and for each vertex, store a list of its neighbors. This method makes it easier to store and retrieve data.
 
 
 
 
 Objective:
 We are going to build a GraphNode with a couple of methods.
 
 ✅ Build Vertex class
     ✅ addNeighbor()
     ✅ getNeighbors()
     ✅ getID
     ✅ getWeight
 
 ✅ Build Graph class
     ✅ addVertex()
     ✅ getVertex()
     ✅ addEdge()
     ✅ getVertices()
 */


// MARK: - Creating Vertex
class Vertex {
    var id: String
    var connectedTo: [Vertex: Int]
    
    init(_ data: String) {
        self.id = data; connectedTo = [:]
    }
    
    func addNeighbor(_ neighbor: Vertex, withWeight weight: Int = 0) {
        connectedTo[neighbor] = weight
    }
    
    func getConnections() -> [Dictionary<Vertex, Int>.Keys.Element] {
        return Array(connectedTo.keys)
    }
    
    func getID() -> String {
        return id
    }
    
    func getWeight(for neighbor: Vertex) -> Int? {
        return connectedTo[neighbor]
    }
}

extension Vertex: Hashable {
    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.id == rhs.id
    }
    public var hashValue: Int { // 1
        return "\(id)".hashValue
    }
}


// MARK: - Graph

class Graph {
    var vertList: [String: Vertex]
    var numberOfVerticies: Int
    
    init() {
        vertList = [:]; numberOfVerticies = 0
    }
    
    func addVertex(data key: String) {
        numberOfVerticies += 1
        let newVertex = Vertex(key)
        vertList[key] = newVertex
    }
    
    func getVertex(withData key: String) -> Vertex? {
        if vertList[key] != nil {
            return vertList[key]
        } else {
            return nil
        }
    }
    
    func addEdge(from source: String, to destination: String, withWeight weight: Int = 0) {
        
        if vertList[source] != nil {
            self.addVertex(data: source)
        }
        if vertList[destination] != nil {
            self.addVertex(data: destination)
        }
        vertList[source]?.addNeighbor(vertList[destination]!, withWeight: weight)
        
    }
    
    func getVerticies() -> Dictionary<String, Vertex>.Keys {
        return vertList.keys
    }
    
    
    func printDescription() {
        var result = ""
        for (key, value) in vertList {
            var edgeString = ""
            
            let connections = value.getConnections()
            for neighbor in connections {
                edgeString.append("\(neighbor.id), ")
            }
            
            result.append("\(key) ---> [ \(edgeString) ] \n")
        }
        
        print(result)
    }
}


var g = Graph()

let oakland = "Oakland"
let sanFrancisco = "San Francisco"
let losAngeles = "Los Angeles"
let sanDiego = "San Diego"
let lasVegas = "Las Vegas"
let seatle = "Seatle"


g.addVertex(data: oakland)
g.addVertex(data: sanFrancisco)
g.addVertex(data: losAngeles)
g.addVertex(data: sanDiego)
g.addVertex(data: lasVegas)
g.addVertex(data: seatle)

g.addEdge(from: oakland, to: sanFrancisco, withWeight: 5)
g.addEdge(from: oakland, to: seatle, withWeight: 2)
//g.addEdge(from: sanFrancisco, to: losAngeles, withWeight: 4)
//g.addEdge(from: losAngeles, to: sanDiego, withWeight: 9)
//g.addEdge(from: sanDiego, to: lasVegas, withWeight: 7)
//g.addEdge(from: sanDiego, to: seatle, withWeight: 3)
//g.addEdge(from: lasVegas, to: oakland, withWeight: 1)
//g.addEdge(from: seatle, to: lasVegas, withWeight: 8)
//g.addEdge(from: seatle, to: losAngeles, withWeight: 1)

g.printDescription()

/*
 EXPECTING:
 Los Angeles ---> [ San Diego, ]
 Oakland ---> [ San Francisco, Seatle, ]
 San Francisco ---> [ Los Angeles, ]
 Seatle ---> [ Las Vegas, Los Angeles, ]
 San Diego ---> [ Las Vegas, Seatle, ]
 Las Vegas ---> [ Oakland, ]
 
 MY RESULTS:
 Los Angeles ---> [  ]
 Oakland ---> [  ]
 San Francisco ---> [ Los Angeles,  ]
 Seatle ---> [ Los Angeles,  ]
 San Diego ---> [ Seatle,  ]
 Las Vegas ---> [  ]

 For some reason, the connections get lost.
 
 */
