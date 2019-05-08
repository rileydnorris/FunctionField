//
//  HeightField.swift
//  FunctionField
//
//  Created by Riley Norris on 5/1/19.
//

import UIKit

public class HeightField: UITextField {
    
    // MARK: - Properties
    
    let picker = UIPickerView()
    var height: Int = 0
    var feet = 0
    var inches = 0
    
    var isMetric: Bool = false {
        didSet {
            metricConversion()
            picker.reloadAllComponents()
        }
    }
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        createPicker()
    }
    
    // MARK: - User Side Functions
    
    /// Sets the height stored in textfield and updates the text
    func setHeight(from number: Int) {
        self.height = number
        setFieldText(value: number)
    }
    
    // MARK: - Utility Functions
    
    /// Sets the text the user will see
    func setFieldText(value: Int, isFeet: Bool = false) {
        // set metric value
        if isMetric {
            height = value
            self.text = "\(height) cm"
            
            // set imperial value
        } else {
            if isFeet {
                feet = value
            } else {
                inches = value
            }
            height = inches + feet*12
            
            // TODO: Support displaying feet as well
            
            self.text = "\(height) in"
        }
    }
    
    /// Converts the data to metric or imperial
    func metricConversion() {
        if isMetric {
            height = Int(round(Double(height) * 2.54))
            self.text = "\(height) cm"
            
        } else {
            height = Int(round(Double(height) / 2.54))
            self.text = "\(height) in"
        }
    }
}

// MARK: - Picker Delegate

extension HeightField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    /// Sets up the picker
    func createPicker() {
        picker.delegate = self
        self.inputView = picker
    }
    
    /// Number of sections in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if isMetric { return 1 } else { return 2 }
    }
    
    /// Setting number of rows in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isMetric {
            return 251
        } else {
            if component == 0 { return 10 } else { return 12 }
        }
    }
    
    /// Setting picker values
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // no data selected
        if row == 0 {
            return ""
        } else {
            
            // TODO: Support columns for meters & centimeters
            
            // metric is chosen
            if isMetric {
                return "\(row) cm"
                
            // imperial is chosen
            } else {
                
                // if editing "feet" column
                if component == 0 {
                    return "\(row) ft"
                    
                // if editing "inch" column
                } else {
                    return "\(row) in"
                }
            }
        }
    }
    
    /// Setting values if picker selects something
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setFieldText(value: row, isFeet: (component == 0))
    }
}

