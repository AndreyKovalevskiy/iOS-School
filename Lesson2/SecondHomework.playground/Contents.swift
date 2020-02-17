/// An object, which is a list of elements with a type integer, organized according to the LIFO principle.
class Stack {
    private var array: [Int] = []
    
    func push(element: Int) {
        array.append(element)
    }
    
    func pop() -> Int? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    func top() -> Int? {
        return array.last
    }
}

/// An object, which is a list of elements with a type integer, organized according to the LIFO principle.
class StackStatistics: Stack {
    private var list = LinkedList()
    
    override func push(element: Int) {
        list.addNode(value: element)
        super.push(element: element)
    }
    
    override func pop() -> Int? {
        list.removeLast()
        return super.pop()
        
    }
    
    func minimumElement() -> Int? {
        return list.getLast()?.getValue()
    }
}

/// An object storing data and a link to an element associated with it
class Node {
    private var value: Int?
    private var previous: Node?
    
    init(value: Int, previous: Node?) {
        self.value = value
        self.previous = previous
    }
    
    func getValue() -> Int? {
        return value
    }
    
    func getPrevious() -> Node? {
        return previous
    }
}

/// Аn object consisting of elements of the same type, each of which has a pointer to the previous element
class LinkedList {
    private var last: Node?
    
    func addNode(value: Int) {
        let currentValue = last?.getValue()
        if currentValue == nil || value < currentValue!  {
            last = Node(value: value, previous: last)
        } else {
            last = Node(value: currentValue!, previous: last)
        }
    }
    
    func removeLast() {
        last = last?.getPrevious()
    }
    
    func getLast() -> Node? {
        return last
    }
}
