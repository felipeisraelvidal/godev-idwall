import UIKit

public final class Stack<T: Equatable> {
    
    private(set) var arr: [T] = []
    
    public var isEmpty: Bool {
        return arr.count == 0
    }
    
    public func push(_ element: T) {
        arr.append(element)
    }
    
    public func pop() -> T? {
        if !isEmpty {
            let lastElement = arr.last
            arr.removeLast()
            return lastElement
        }
        return nil
    }
    
    public func printStack() {
        print(arr)
    }
    
    public func top() -> T? {
        return arr.last
    }
    
}

let myStack = Stack<Int>()

myStack.push(21)
myStack.push(22)
myStack.push(24)
myStack.push(25)

let _ = myStack.pop()
let _ = myStack.pop()

while !myStack.isEmpty {
    print(myStack.pop() ?? "Empty Stack")
    print(myStack.pop() ?? "Empty Stack")
}
