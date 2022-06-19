/// Singly-linked-list
class Node {
    var val: Int
    var next: Node?

    init(_ val: Int) {
        self.val = val
    }
}


class MyLinkedList {

    var head: Node?
    
    init() { }
    init(head: Node?) {
        self.head = head
    }
    
    func get(_ index: Int) -> Int {
        if head == nil { return -1 }
        if index < 0 { return -1 }
        
        var currentNode = head
        var currentIndex = 0
        
        while currentIndex < index {
            if currentNode == nil { return -1 }
            
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        if currentNode == nil {
            return -1
        } else {
            return currentNode!.val
        }
    }
    
    func addAtHead(_ val: Int) {
        let newHead = Node(val)
        
        if head == nil {
            head = newHead
        }
        
        newHead.next = head
        head = newHead
    }
    
    func addAtTail(_ val: Int) {
        let tail = Node(val)
        var currentHead = head
        while currentHead?.next != nil {
            currentHead = currentHead?.next
        }
        currentHead?.next = tail
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let newNode = Node(val)
        var currentIndex = 0
        var currentNode = head
        
        if index == 0 {
            newNode.next = head
            head = newNode
        }
        
        while currentNode?.next != nil {
            if currentIndex == (index - 1) {
                newNode.next = currentNode?.next
                currentNode?.next = newNode
                return
            }
            
            currentNode = currentNode?.next
            currentIndex += 1
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        var currentIndex = 0
        var currentNode = head
        
        if index == 0 {
            head = head?.next
        }
        
        while currentNode?.next != nil {
            print(currentIndex, index - 1)
            if currentIndex == (index - 1) {
                print(currentNode?.val)
                print(currentNode?.next?.val)
                print(currentNode?.next?.next?.val)
                
                currentNode?.next = currentNode?.next?.next
                return
            }
            
            currentNode = currentNode?.next
            currentIndex += 1
        }
    }
}


var node1 = Node(1)
var node2 = Node(2)
var node3 = Node(3)
node1.next = node2
node2.next = node3

let ll = MyLinkedList()
ll.get(0)

ll.addAtHead(7)
ll.addAtHead(2)
ll.addAtHead(1)

ll.get(0)
ll.get(1)
ll.get(2)
ll.get(3)
ll.get(4)
ll.get(5)
ll.get(6)
ll.get(7)
ll.get(8)
ll.get(9)

ll.addAtIndex(3, 0)
ll.get(0)
ll.get(1)
ll.get(2)
ll.get(3)
ll.get(4)
ll.get(5)
ll.get(6)
ll.get(7)
ll.get(8)
ll.get(9)


ll.deleteAtIndex(2)
ll.get(0)
ll.get(1)
ll.get(2)
ll.get(3)
ll.get(4)


// ["","","","","","deleteAtIndex","addAtHead","addAtTail","get","addAtHead","addAtIndex","addAtHead"]
// [[],[],[],[],[,],[2],[6],[4],[4],[4],[5,0],[6]]
