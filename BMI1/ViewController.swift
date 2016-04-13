//
//  ViewController.swift
//  BMI1
//
//  Created by Release on 2016. 3. 30..
//  Copyright © 2016년 Release. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BMILabel: UILabel!
    
    @IBOutlet weak var HeightTextField: UITextField!
    
    @IBOutlet weak var WeightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // inspect which UITextField is selected
        // tell the textField to resign as the first responder
        // tell the textField to stop receiving keyboard input
        textField.resignFirstResponder()
        return true
    }

}

