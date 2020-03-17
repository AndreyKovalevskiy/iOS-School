/// Class describing the list of elements organized according to the LIFO principle.
class Stack<T> {
    private var array: [T] = []
    
    /// Adds element on the top of the stack.
    /// - Parameter element: The element to append to the stack.
    /// - Complexity: O(1)
    func push(element: T) {
        array.append(element)
    }
    
    /// Removes and returns the top element of the stack.
    /// - Complexity: O(1)
    /// - Returns: The top element of the stack if the stack is not empty; otherwise, nil.
    func pop() -> T? {
        return array.popLast()
    }
    
    /// Returns the top element of the stack.
    /// - Complexity: O(1)
    /// - Returns: The top element of the stack if the stack is not empty; otherwise, nil.
    func top() -> T? {
        return array.last
    }
}

/// Class describing the list of elements organized according to the LIFO principle.
/// Each stack element must conform to the Comparable protocol.
class StackStatistics<T: Comparable>: Stack<T> {
    private var minimalValues: [T] = []
    
    override func push(element: T) {
        if minimalValues.isEmpty || element < minimalValues.last! {
            minimalValues.append(element)
        } else {
            minimalValues.append(minimalValues.last!)
        }
        super.push(element: element)
    }
    
    override func pop() -> T? {
        minimalValues.popLast()
        return super.pop()
    }
    
    /// Returns the minimum element in the stack.
    /// - Complexity: O(1)
    /// - Returns: The minimum element of the stack if the stack is not empty; otherwise, nil.
    func minimumElement() -> T? {
        return minimalValues.last
    }
}
