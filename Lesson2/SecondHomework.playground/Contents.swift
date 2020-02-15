/// An object, which is a list of elements with a type integer, organized according to the LIFO principle.
class Stack {
    private var array: [Int] = [] {
        didSet {
            topElement = array.last
            minimalValue = array.min()
        }
    }
    private var topElement: Int?
    private var minimalValue: Int?
    
    func push(element: Int) {
        array.append(element)
    }
    
    func pop() -> Int? {
        if array.isEmpty {
            return nil
        } else {
            let lastElement = array.removeLast()
            return lastElement
        }
    }
    
    func top() -> Int? {
        return topElement
    }
    
    func min() -> Int? {
        return minimalValue
    }
}

/// An object, which is a list of elements with a type integer, organized according to the LIFO principle.
class StackStatistics: Stack {
    func minimumElement() -> Int? {
        return super.min()
    }
}
