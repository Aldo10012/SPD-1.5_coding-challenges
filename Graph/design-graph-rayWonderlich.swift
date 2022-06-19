import Foundation
import XCPlayground

// Tutorial: https://www.raywenderlich.com/773-swift-algorithm-club-graphs-with-adjacency-list


// MARK: - Creating Vertex
struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int { // 1
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}





// MARK: - Creating Edges
public enum EdgeType {
  case directed, undirected
}

struct Edge<T: Hashable> {
    var source: Vertex<T> // 1
    var destination: Vertex<T>
    let weight: Double? // 2
}

extension Edge: Hashable {
    var hashValue: Int {
        return "\(source)\(destination)\(weight)".hashValue
    }
    
    static func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
        lhs.destination == rhs.destination &&
        lhs.weight == rhs.weight
    }
}





// MARK: - Graphable protocol
protocol Graphable {
    associatedtype Element: Hashable // 1
    
    /// The description property lets you define custom behavior to print out the contents of a graph. This can help with debugging!
    var description: CustomStringConvertible { get }
    
    /// provides a utility method to create a vertex.
    func createVertex(data: Element) -> Vertex<Element>
    
    /// provides a utility to add an edge between two vertices. You can specify the weight as well as whether an edge is directed or undirected.
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
    /// provides a utility to get the weight of an edge between two vertices.
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    
    /// provides a utility to retrieve all the edges that source vertex connects to.
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}





// MARK: - Making the AdjacencyList (Graph)
class AdjacencyList<T: Hashable> {
    var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    init() {}
    
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight) // 1
        adjacencyDict[source]?.append(edge) // 2
    }
    
    func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
}

extension AdjacencyList: Graphable {
    public typealias Element = T
    
    var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        print(result)
        return result
    }
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else { return nil }
        
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        
        return nil
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
  
}




// MARK: - Testing

let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)


adjacencyList.description

