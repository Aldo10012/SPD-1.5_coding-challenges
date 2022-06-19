import Foundation

/**
 GOALS:
 ✅ Create Node object
 ✅ Create Binary Tree
    ✅ insert
    ✅ search
    ✅ print in order
    ✅ print pre order
    ✅ print post order
    ✅ Calulate height`
 */

class Node {
    var data: Int
    var left: Node? = nil
    var right: Node? = nil
    
    init(_ data: Int) {
        self.data = data
    }
    
    
    func insert(_ val: Int) {
        if val < data {
            if left == nil {
                left = Node(val)
                return
            }
            left?.insert(val)
        }
        else {
            if right == nil {
                right = Node(val)
                return
            }
            right?.insert(val)
        }
    }
    
    
    func search(forValue val: Int) -> Bool {
        if val == data {
            return true
        }
        
        if val < data {
            if left == nil {
                return false
            }
            return left!.search(forValue: val)
        }
        else {
            if right == nil {
                return false
            }
            return right!.search(forValue: val)
        }
    }
    

    func printInOrder() {
        if data == nil { return }
        
        if left != nil {
            left?.printInOrder()
        }
        print(data)
        if right != nil {
            right?.printInOrder()
        }
    }
    
    func printPreOrder() {
        if data == nil { return }
        
        print(data)
        
        if left != nil {
            left?.printPreOrder()
        }
        
        if right != nil {
            right?.printPreOrder()
        }
    }
    
    func printPostOrder() {
        if data == nil { return }
        
        if left != nil {
            left?.printPostOrder()
        }
        
        if right != nil {
            right?.printPostOrder()
        }
        
        print(data)
    }
    
    func getHeight() -> Int {
        var leftHeight: Int = 0
        var rightHeight: Int = 0
        
        if left != nil {
            leftHeight = left!.getHeight()
        }
        if right != nil {
            rightHeight = right!.getHeight()
        }
        
        return 1 + max(leftHeight, rightHeight)
    }
}



var node1 = Node(10)
node1.insert(7)
node1.insert(2)
node1.insert(8)
node1.insert(13)
node1.insert(16)

node1.search(forValue: 10)
print("In order")
node1.printInOrder()
print("\nPre order")
node1.printPreOrder()
print("\nPost order")
node1.printPostOrder()
node1.getHeight()




class BinaryTree {
    var head: Node?
    
    init() {
        self.head = nil
    }
    
    // insert
    func insert(_ val: Int, rootNode: Node) {
        if head == nil {
            head = Node(val)
            return
        }    
    }
    
    // search
    func search(_ val: Int) {
        
    }
    
    // print
    func printInOrder() {
        
    }
    
}
