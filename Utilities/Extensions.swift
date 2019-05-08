import Foundation

// MARK: - UITextField

extension UITextField {
    
    /// Adds a toolbar to textfield with a done button
    func addDoneBar() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        doneButton.setTitleTextAttributes([NSAttributedString.Key.font: Global.toolbarFont], for: UIControl.State.normal)
        
        let buttons: [UIBarButtonItem] = [flex, doneButton]
        
        doneToolbar.items = buttons
        doneToolbar.sizeToFit()

        doneToolbar.barTintColor = Global.toolbarBackgroundColor
        doneToolbar.tintColor = Global.toolbarTintColor
        
        self.inputAccessoryView = doneToolbar
    }
    
    /// Dismisses the keyboard
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    /// Updates the textfield from the user's settings
    func updateFromSettings() {
        
    }
}
