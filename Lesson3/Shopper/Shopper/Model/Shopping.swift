import Foundation

class Shopping: ShoppingList {
    private(set) var shoppingList: [String] = []
    let maxNumberOfProducts = 10
    
    func add(_ item: String) -> Bool {
        guard shoppingList.count < maxNumberOfProducts else {
            return false
        }
        
        shoppingList.append(item)
        return true
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
