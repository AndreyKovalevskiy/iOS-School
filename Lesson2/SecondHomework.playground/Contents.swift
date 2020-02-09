/// An object, which is a list of elements with a type integer, organized according to the LIFO principle.
class Stack {
    fileprivate var array: [Int] = []
    fileprivate var topElement: Int?
    
    func push(element: Int) {
        array.append(element)
        topElement = element
    }
    
    func pop() -> Int? {
        if array.isEmpty {
            return nil
        } else {
            let lastElement = array.removeLast()
            topElement = array.isEmpty ? nil : array[array.count - 1]
            return lastElement
        }
    }
    
    func top() -> Int? {
        return topElement
    }
}

/// An object, which is a list of elements with a type integer, organized according to the LIFO principle.
class StackStatistics: Stack {
    private var minimalValue: Int?
    
    override func push(element: Int) {
        array.append(element)
        topElement = element
        minimalValue = array.min()
    }
    
    override func pop() -> Int? {
        if array.isEmpty {
            return nil
        } else {
            let lastElement = array.removeLast()
            topElement = array.isEmpty ? nil : array[array.count - 1]
            minimalValue = array.min()
            return lastElement
        }
    }
    
    func minimumElement() -> Int? {
        return minimalValue
    }
}
