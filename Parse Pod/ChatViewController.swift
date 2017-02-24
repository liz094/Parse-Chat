//
//  ChatViewController.swift
//  Parse Pod
//
//  Created by Lin Zhou on 2/23/17.
//  Copyright © 2017 Lin Zhou. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    var messages = [PFObject]()
    
    @IBAction func newMessage(_ sender: Any) {
        let chatMessage = messageTextField.text
        let currentUser = PFUser.current()!
        
        let message = PFObject(className: "Message")
        message["text"] = chatMessage
        message["user"] = currentUser
        
        message.saveInBackground { (success: Bool, error: Error?) in
            if (success){
                print("Just sent \(chatMessage)")
                //self.messageLabel.text = chatMessage
                self.messages.append(message)
                self.tableView.reloadData()
            }
            else{
                print("error on message")
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

        //tableView.reloadData()
        //Timer.scheduledTimer(timeInterval: 1, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        
        //messageLabel.text=
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onTimer(){
       
        
        var query = PFQuery(className:"Message")
        query.findObjectsInBackground { (objects:[PFObject]?, error: Error?) -> Void in
            if error==nil{
                print("successfully retrieved \(objects!.count) messages")
                
                self.messages = objects!
            }
            else{
                
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! messageCell
        
        let message = messages[indexPath.row]
        cell.messageLabel.text = message["text"] as! String
        
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    

}
