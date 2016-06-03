//
//  ViewController.swift
//  BMI1
//
//  Created by Release on 2016. 3. 30..
//  Copyright © 2016년 Release. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    class func doDiv100(u: Int) -> Double {
        return Double(u) * 0.01
    }
    class func doDiv2(u: Int) -> Double {
        return Double(u) * 0.5
    }
    
    let ListOfHeightsInM : Array<Double> = Array(140...220).map(ViewController.doDiv100)
    let ListOfWeightsInKg = Array(80...240).map(ViewController.doDiv2)
    
    // Adding Model
    // No designignagted intit() for UIViewController
    var weight : Double? = 0.0
    var height : Double? = 0.0
    //computed property for bmi
    var bmi: Double?{
        get{
            if (weight != nil)&&(height != nil){
                return weight! / (height! * height!)
            }
            else {
                return nil
            }
        }
    }

    @IBOutlet weak var BMILabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightPickerView: UIPickerView!
    
    @IBOutlet weak var weightPickerView: UIPickerView!
    
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
    
    // Update UI
    func updateUI(){
        if let b = self.bmi{
            self.BMILabel.text = String (format: "%4.1f", b)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        guard let txt: String = textField.text else{
            return
        }
        
        func conv(numString: String) -> Double? {
            let result : Double? = NSNumberFormatter().numberFromString(numString)?.doubleValue
            return result
        }
        
        switch(textField){
        case heightTextField:
            self.height = conv(txt)
        case weightTextField:
            self.weight = conv(txt)
        default:
            print(" Something Wrong")
        }
        
        updateUI()
    }
    
    // PickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch(pickerView){
        case heightPickerView:
            return self.ListOfHeightsInM.count
        case weightPickerView:
            return self.ListOfWeightsInKg.count
        default:
            return 1
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (pickerView) {
        case heightPickerView:
            return String(format: "%4.2f", self.ListOfHeightsInM[row])
        case weightPickerView:
            return String(format: "%4.1f", self.ListOfWeightsInKg[row])
        default:
            return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (pickerView) {
        case heightPickerView:
            self.height = self.ListOfHeightsInM[row]
        case weightPickerView:
            self.weight = self.ListOfWeightsInKg[row]
        default:
            break
        }
        updateUI()
    }

}

