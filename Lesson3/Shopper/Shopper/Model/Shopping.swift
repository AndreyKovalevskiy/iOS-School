import Foundation

class Shopping: ShoppingList {
    private(set) var shoppingList: [String] = []
    
    func add(_ item: String) -> Bool {
        if shoppingList.count == 10 {
            return false
        } else {
            shoppingList.append(item)
            return true
        }
    }
    
    func remove(_ item: String) -> Bool {
        if let lastIndex = shoppingList.lastIndex(of: item) {
            shoppingList.remove(at: lastIndex)
            return true
        } else {
            return false
        }
    }
    
    func remove(at index: Int) -> Bool {
        if shoppingList.indices.contains(index) {
            shoppingList.remove(at: index)
            return true
        } else {
            return false
        }
    }
}
