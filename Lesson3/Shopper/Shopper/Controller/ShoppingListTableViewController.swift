import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    var shopping = Shopping()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem" {
            if tableView.numberOfRows(inSection: 0) < shopping.maxNumberOfProducts {
                guard let productVC = segue.destination as? ProductViewController else { return }
                present(productVC, animated: true)
            } else {
                let alert = UIAlertController(title: "Сan't add a product",
                                              message: "You can add no more than \(shopping.maxNumberOfProducts) products",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func unwindToShoppingList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ProductViewController, let product = sourceViewController.product {
            
            let newIndexPath = IndexPath(row: shopping.shoppingList.count, section: 0)
            
            if shopping.add(product) {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}

extension ShoppingListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopping.shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? ShoppingListTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of ShoppingListTableViewCell.")
        }
        
        cell.nameLabel.text = shopping.shoppingList[indexPath.row]
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
