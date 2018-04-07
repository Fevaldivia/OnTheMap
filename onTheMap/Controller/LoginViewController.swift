//
//  LoginViewController.swift
//  onTheMap
//
//  Created by Felipe Valdivia on 3/31/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        if userName.text!.isEmpty || userPassword.text!.isEmpty {
            infoLabel.text = "Username or Password is Empty."
        }else{
            var request = URLRequest(url: URL(string: UdacityClient.SessionAPI.AuthorizationURL)!)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonBody = "{\"udacity\": {\"username\": \"\(self.userName.text!)\", \"password\": \"\(self.userPassword.text!)\"}}"
            request.httpBody = jsonBody.data(using: .utf8)
            let session = URLSession.shared
            print(session)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil { // Handle error…
                    self.infoLabel.text = "There is an error with your user or password."
                    return
                }
                let range = Range(5..<data!.count)
                let newData = data?.subdata(in: range) /* subset response data! */
                print(String(data: newData!, encoding: .utf8)!)
                
                performUIUpdatesOnMain {
                     self.completeLogin()
                }
               
            }
            task.resume()
        }
    }
    
    private func completeLogin() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "ManagerNavigationController") as! UINavigationController
        present(controller, animated: true, completion: nil)
    }
    

}

