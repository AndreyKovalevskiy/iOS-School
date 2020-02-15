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
    private var minimalValues: [Int] = []
    
    override func push(element: Int) {
        if minimalValues.isEmpty || element < minimalValues.last! {
            minimalValues.append(element)
        } else {
            minimalValues.append(minimalValues.last!)
        }
        super.push(element: element)
    }
    
    override func pop() -> Int? {
        if !minimalValues.isEmpty {
            minimalValues.removeLast()
        }
        return super.pop()
        
    }
    
    func minimumElement() -> Int? {
        return minimalValues.last
    }
}
