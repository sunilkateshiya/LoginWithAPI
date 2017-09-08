//
//  ViewController.swift
//  LoginDemo
//
//  Created by iFlame on 8/23/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernametxt: UITextField!

    @IBOutlet weak var passwordtxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func LoginClick(_ sender: Any) {
        
        
        let postString = "email=\(usernametxt.text!)&password=\(passwordtxt.text!)"

        
        let request = NSMutableURLRequest(url: NSURL(string: "yourApi/\(postString)")! as URL)
        
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
            
            if (responseString?.contains("error"))! {
                
                DispatchQueue.main.async {
                    
                    
                    print("Fails")
                    
                    let alert = UIAlertController(title: "LoginFail", message: "Username or Password Check!!!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }else {
                
                DispatchQueue.main.async {
                    
                   
                    print("Success")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    self.present(vc, animated: true, completion: nil)
                    
                }
                
            }
            
            
            
        }
        task.resume()
        
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

