//
//  SignUpViewController.swift
//  LoginDemo
//
//  Created by iFlame on 8/23/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var rusernametxt: UITextField!
    
    @IBOutlet weak var remailtxt: UITextField!
    
    @IBOutlet weak var rpasswordtxt: UITextField!
    
    @IBOutlet weak var rgendertxt: UITextField!
    
    @IBOutlet weak var rtypetxt: UITextField!
    
    @IBOutlet weak var dateofbirthtxt: UITextField!
    
    @IBOutlet weak var locationtxt: UITextField!
    
    @IBOutlet weak var phonenotxt: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SubmitClick(_ sender: Any) {
        
         let postString = "username=\(rusernametxt.text!)&email=\(remailtxt.text!)&password\(rpasswordtxt.text!)&gender=\(rgendertxt.text!)&type=\(rtypetxt.text!)&dob=\(dateofbirthtxt.text!)&location=\(locationtxt.text!)&phone_num=\(phonenotxt.text!)"
        
        let request = NSMutableURLRequest(url: NSURL(string: "yourApi\(postString)")! as URL)
        
        request.httpMethod = "POST"
        
       
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                
                return
            }
            
            print("response=\(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("responseString=\(String(describing: responseString))")
            
            
            
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
