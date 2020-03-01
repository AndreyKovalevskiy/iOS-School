import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    var shopping = Shopping()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopping.shoppingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ShoppingListTableViewCell
        cell.nameLabel.text = shopping.shoppingList[indexPath.row]
        return cell
    }
    
    @IBAction func addProduct(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Product addition", message: "Enter product name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if let text = alert.textFields?.first?.text {
                if self.shopping.add(text) {
                    self.tableView.reloadData()
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func removeProduct(_ sender: UIBarButtonItem) {
        guard self.tableView.numberOfRows(inSection: 0) > 0 else { return }
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            if self.shopping.remove(at: indexPath.row) {
                self.tableView.reloadData()
                return
            }
        }
        
        let alert = UIAlertController(title: "Product removal", message: "Enter product name", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            if let text = alert.textFields?.first?.text {
                if self.shopping.remove(text) {
                    self.tableView.reloadData()
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
