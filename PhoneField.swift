import Foundation

public class PhoneField: UITextField, UITextFieldDelegate {
    
    // MARK: - Core Functions
    
    /// Called as textfield is instantiated
    public override func awakeFromNib() {
        self.delegate = self
        self.keyboardType = .numberPad
    }
    
    /// Detects every new character the user types
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return self.convert(userText: string)
    }
    
    /// Function to actually convert to format
    func convert(userText: String) -> Bool {
        if userText == "" { return true }
        
        switch self.text!.count {
        case 0: self.text = "("
        case 4: self.text = self.text! + ") "
        case 9: self.text = self.text! + "-"
        case _ where self.text!.count > 13: return false
        default: return true
        }
        return true
    }
}
