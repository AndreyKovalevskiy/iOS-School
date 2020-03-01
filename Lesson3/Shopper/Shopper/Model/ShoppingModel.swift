import Foundation

class Shopping: ShoppingList {
    var shoppingList: [String] = []
    
    func add(_ item: String) -> Bool {
        if shoppingList.count == 10 {
            return false
        } else {
            shoppingList.append(item)
            return true
        }
    }
    
    func remove(_ item: String) -> Bool {
        if shoppingList.contains(item) {
            shoppingList.removeAll(where:{ item == $0 })
            return true
        } else {
            return false
        }
    }
    
    func remove(at index: Int) -> Bool {
        if index < shoppingList.count {
            shoppingList.remove(at: index)
            return true
        } else {
            return false
        }
    }
}
