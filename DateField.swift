import Foundation

public class DateField: UITextField {
    
    // MARK: - Properties
    
    var date: Date = Date()
    let datePicker: UIDatePicker = UIDatePicker()
    var stringFormat: String = "MMMM dd, yyyy"
    
    // MARK: - Life Cycle
    
    public override func awakeFromNib() {
        createDatePicker()
    }
    
    // MARK: - User Side Functions
    
    /// Set the textfield's date and update text
    func setDate(from userDate: Date) {
        self.datePicker.date = userDate
        selectDate()
    }
    
    // MARK: - Utility Functions
    
    /// Converts a UIDate to a string
    func convertToString(userDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = stringFormat
        return dateFormatter.string(from: userDate)
    }
    
    /// Sets the date's time to be 0, for extra protection
    func setTimeToZero(userDate: Date) -> Date {
        let cal = Calendar(identifier: .gregorian)
        var components = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: userDate)
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        return cal.date(from: components)!
    }
}

// MARK: - Date Picker Functions

extension DateField {
    
    /// Sets up the date picker within the textfield
    func createDatePicker() {
        
        // TODO: Support multiple date types
        
        // set up date picker
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(selectDate), for: UIControl.Event.valueChanged)
        
        // add date picker as input view
        self.inputView = datePicker
    }
    
    /// Selects a date
    @objc func selectDate() {
        self.date = setTimeToZero(userDate: datePicker.date)
        self.text = convertToString(userDate: date)
    }
}
