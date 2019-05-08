//
//  ViewController.swift
//  FunctionField
//
//  Created by rileydnorris on 04/28/2019.
//  Copyright (c) 2019 rileydnorris. All rights reserved.
//

import UIKit
import FunctionField

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneField: PhoneField!
    @IBOutlet weak var dateField: DateField!
    @IBOutlet weak var heightField: HeightField!
    @IBOutlet weak var stateField: StateField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

