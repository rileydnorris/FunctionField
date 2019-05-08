//
//  FunctionField.swift
//  FunctionField
//
//  Created by Riley Norris on 5/1/19.
//

import Foundation

/// Class for the user to globally apply settings among the dependency
class FunctionField {
    
    /**
     Set the tint color for the toolbar above the text field (changes color of toolbar items)
     - Parameter color: The color you'd like to set for the tint color
    */
    func setToolbarTintColor(color: UIColor) {
        Global.toolbarTintColor = color
    }
}
