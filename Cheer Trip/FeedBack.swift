//
//  SignIn.swift
//  Cheer Trip
//
//  Created by MarwenDoukh on 3/13/17.
//  Copyright © 2017 MarwenDoukh. All rights reserved.
//

import UIKit
import Alamofire




class FeedBack: UIViewController {
    @IBOutlet weak var feedbacktext: UITextField!
    

    
    @IBAction func sendFeedback(_ sender: Any) {
       
        var FeedbackJson:NSMutableDictionary?
        
        
          FeedbackJson  = [
            
                "cleanliness" : false
                
        ]
        
       // let json = JSON(data: "")
     //   json["name"] = JSON("new-name")
     //   json[0] = JSON(1)
        
      //  json["id"].int =  1234567890
        
        
        print(cleanlness.isOn)
        
        if(!cleanlness.isOn)
        {
            FeedbackJson?.setValue(cleanlness.isOn, forKey: "cleanliness")
        }
        if(!noise.isOn){
            FeedbackJson?.setValue(noise.isOn, forKey: "noise")
    }
        if(!availalbility.isOn){
    FeedbackJson?.setValue(availalbility.isOn, forKey: "availability")
}

        if(!crowded.isOn){
            FeedbackJson?.setValue(crowded.isOn, forKey: "crowded")
        }

        if(!security.isOn){
            FeedbackJson?.setValue(security.isOn, forKey: "security")
        }


        FeedbackJson?.setValue(feedbacktext.text, forKey: "otherComments")
        
        let calendar = NSCalendar.current
        
        let today = Date()
        
        let day = calendar.component(.day, from: today as Date)
        let month = calendar.component(.month, from: today as Date)
        let year = calendar.component(.year, from: today as Date)
        let hour = calendar.component(.hour, from: today as Date)
        let minute = calendar.component(.minute, from: today as Date)
        let second = calendar.component(.second, from: today as Date)


      let  timestampString =  "\(year)-\(month)-\(day) \(hour):\(minute):\(second)"
        
        
        
        FeedbackJson?.setValue(timestampString, forKey: "timestamp")

        

        print (FeedbackJson?.value(forKey: "timestamp"))
        print (FeedbackJson?.value(forKey: "security"))
        print (FeedbackJson?.allKeys)
        print (FeedbackJson?.allValues)


        
        
        
        Alamofire.request("https://070537b0-4978-4e56-9b63-2917ba531505-bluemix.cloudant.com/mobileusersfeedback", method: HTTPMethod.post, parameters: FeedbackJson as? Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value!)
                    self.performSegue(withIdentifier: "thanksgiving", sender: nil)

                }
                break
                
            case .failure(_):
                print(response.result.error)
                let alert = UIAlertController(title: "Cheer Trip", message: "An error occured , please retry again !", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                break
                
            }
        }
    
    
    
    
    }
    
    
    
    
    
    
    
    @IBOutlet weak var cleanlness: UISwitch!
    @IBOutlet weak var noise: UISwitch!
    @IBOutlet weak var availalbility: UISwitch!
    @IBOutlet weak var comfort: UISwitch!
    @IBOutlet weak var crowded: UISwitch!
    @IBOutlet weak var security: UISwitch!
    

    
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
