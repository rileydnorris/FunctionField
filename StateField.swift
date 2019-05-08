//
//  StateField.swift
//  FunctionField
//
//  Created by Riley Norris on 5/1/19.
//

import UIKit

public class StateField: UITextField {
    
    // MARK: - Properties
    
    let picker = UIPickerView()
    var selectedState: String = ""
    
    let states: [String] = [ "", "AK", "AL", "AR", "AS", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"]
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        createPicker()
    }
    
    // MARK: - User Side Functions
    
    /// Fuction to set the text and state from a view controller
    func setState(from newState: String) {
        self.selectedState = newState
        self.text = newState
    }
}

// MARK: - Picker Delegate

extension StateField: UIPickerViewDataSource, UIPickerViewDelegate {
    
    /// Sets up the picker
    func createPicker() {
        picker.delegate = self
        self.inputView = picker
    }
    
    /// Number of sections in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// Setting number of rows in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 51
    }
    
    /// Setting picker values
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return ""
        } else {
            return Strings.states[row]
        }
    }
    
    /// Setting values if picker selects something
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = Strings.states[row]
        self.selectedState = Strings.states[row]
    }
}
