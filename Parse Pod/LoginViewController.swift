//
//  ViewController.swift
//  Parse Pod
//
//  Created by Lin Zhou on 2/23/17.
//  Copyright © 2017 Lin Zhou. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUp(_ sender: Any) {
        
        var user = PFUser()
        //user.username =
        user.password = passwordTextField.text
        user.email = emailTextField.text
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackground { (succeeded: Bool, error: Error?) in
            if let error = error{
                print("Error signing up \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Error", message: "Invalid sign up information", preferredStyle: .alert)
                
                //create a cancel action
                let cancelAction = UIAlertAction(title:"cancel", style: .cancel){
                    (action) in
                }
                
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }

            }
            else{
                print("Successfully signed up")
            }
        }
        

    }
    @IBAction func logIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error:Error?) in
            if(self.emailTextField.text == nil) {return}
            if(self.passwordTextField.text == nil) {return}
            
   
        }
        
//        PFUser.logInWithUsernameInBackground(emailTextField.text!, password:passwordTextField.text!) {
//            (user: PFUser?, error: NSError?)  in
//            if let error = error{
//                
//            }
//            else{
//                
//            }
// 
//        }

    }

    //var user = PFUser()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    


}

