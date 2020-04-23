import Foundation

protocol ShoppingList {
    /// Stores items to shop
    var shoppingList: [String] { get }
    /// Maximum number of items that can be stored in the list.
    var maximumNumberOfItems: Int { get }
    
    /**
     Adds the item in the end of the list.
     
     - Parameter: item: Item to add into a `shoppingList`.
     - Returns: `true` if the `item` was added into a `shoppingList`, otherwise `false`.
     */
    func add(_ item: String) -> Bool
    
    /**
     Removes the item at specified index from the list.
     
     - Parameter index: The position of the elemenmt in the `shoppingList` to remove.
     - Returns: `true` if the item at `index` was removed from a `shoppingList`, otherwise `false`.
     */
    func remove(at index: Int) -> Bool
}
