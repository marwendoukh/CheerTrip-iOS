//
//  SignIn.swift
//  Cheer Trip
//
//  Created by MarwenDoukh on 3/13/17.
//  Copyright © 2017 MarwenDoukh. All rights reserved.
//

import UIKit

class SignIn: UIViewController {
    
    
    @IBOutlet weak var ticketNumber: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        
        if (ticketNumber.text == "123456")
        {
            performSegue(withIdentifier: "feedback", sender: nil)

        }
        else{
            let alert = UIAlertController(title: "Cheer Trip", message: "Please check your ticket number !", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
