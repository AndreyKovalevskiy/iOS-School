import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    var shopping = Shopping()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "addItem", shopping.shoppingList.count < shopping.maximumNumberOfItems else {
            let alert = UIAlertController(title: "Сan't add a product",
                                          message: "You can add no more than \(shopping.maximumNumberOfItems) products",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func unwindToShoppingList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ProductViewController, let product = sourceViewController.product {
            if shopping.add(product) {
                tableView.reloadData()
            }
        }
    }
}

extension ShoppingListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopping.shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as? ShoppingListTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of ShoppingListTableViewCell.")
        }
        
        cell.itemNameLabel.text = shopping.shoppingList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if shopping.remove(at: indexPath.row) {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
