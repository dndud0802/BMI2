//
//  BMIAboutViewController.swift
//  BMI1
//
//  Created by Release on 2016. 6. 1..
//  Copyright © 2016년 Release. All rights reserved.
//

import UIKit

class BMIAboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doDismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
