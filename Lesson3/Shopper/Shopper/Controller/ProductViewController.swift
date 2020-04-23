import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var nameProduct: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var product: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameProduct.delegate = self
        
        updateSaveButtonState()
        nameProduct.addTarget(self, action: #selector(textfieldChanged), for: .editingChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        product = nameProduct.text
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateSaveButtonState() {
        let nameProduct = self.nameProduct.text ?? ""
        saveButton.isEnabled = !nameProduct.isEmpty
    }
}

extension ProductViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    @objc private func textfieldChanged() {
        updateSaveButtonState()
    }
}
