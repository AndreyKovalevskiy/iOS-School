/// An object, which is a list of elements, organized according to the LIFO principle.
class Stack<T> {
    private var array: [T] = []
    
    /// Adds element on the top of the stack
    /// - Parameter element: The element to append to the stack.
    /// - Complexity: O(1)
    func push(element: T) {
        array.append(element)
    }
    
    /// Removes and returns the top element of the stack. Returns nil when the invoking stack is empty.
    /// - Complexity: O(1)
    /// - Returns: The top element of the stack or nil.
    func pop() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    /// Returns the top element of the stack. Returns nil when the invoking stack is empty
    /// - Complexity: O(1)
    /// - Returns: The top element of the stack or nil.
    func top() -> T? {
        return array.last
    }
}

/// An object, which is a list of elements, organized according to the LIFO principle.
/// Each stack element must conform to the Comparable protocol.
class StackStatistics<T: Comparable>: Stack<T> {
    private var minimalValues: [T] = []
    
    /// Adds element on the top of the stack
    /// - Parameter element: The element to append to the stack.
    /// - Complexity: O(1)
    override func push(element: T) {
        if minimalValues.isEmpty || element < minimalValues.last! {
            minimalValues.append(element)
        } else {
            minimalValues.append(minimalValues.last!)
        }
        super.push(element: element)
    }
    
    /// Removes and returns the top element of the stack. Returns nil when the invoking stack is empty.
    /// - Complexity: O(1)
    /// - Returns: The top element of the stack or nil.
    override func pop() -> T? {
        if !minimalValues.isEmpty {
            minimalValues.removeLast()
        }
        return super.pop()
    }
    
    /// Returns the minimum element in the stack. Returns nil when the invoking stack is empty.
    /// - Complexity: O(1)
    /// - Returns: The last minimum element of the stack or nil.
    func minimumElement() -> T? {
        return minimalValues.last
    }
}
