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
            var request = URLRequest(url: URL(string: ApiClient.SessionAPI.AuthorizationURL)!)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonBody = "{\"udacity\": {\"username\": \"\(self.userName.text!)\", \"password\": \"\(self.userPassword.text!)\"}}"
            request.httpBody = jsonBody.data(using: .utf8)
            let session = URLSession.shared
            print(session)
            let task = session.dataTask(with: request) { data, response, error in
                
                func sendError(_ error: String){
                    print(error)
                    self.infoLabel.text = "Error with your user name or password"
                }
                
                /* GUARD: Was there an error? */
                guard (error == nil) else {
                    sendError("There was an error with your request: \(error!)")
                    return
                }
                
                /* GUARD: Did we get a successful 2XX response? */
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                    sendError("Your request returned a status code other than 2xx!")
                    return
                }
                
                /* GUARD: Was there any data returned? */
                guard let data = data else {
                    sendError("No data was returned by the request!")
                    return
                }
                
               
                let range = Range(5..<data.count)
                let newData = data.subdata(in: range)/* subset response data! */
                
                //Parse the data and use the data (happens in completion handler)
                var parsedResults: AnyObject! = nil
                
                do{
                    parsedResults = try JSONSerialization.jsonObject(with: newData, options: .allowFragments) as AnyObject
                    print(parsedResults)
                }catch{
                    print("error parsing JSON \(LocalizedError.self)")
                }
                
                if let accountDicitionary = parsedResults["account"] as? [String:AnyObject],
                    let sessionDictinary = parsedResults["session"] as? [String:AnyObject]{
                    
                    let key = accountDicitionary["key"] as! String?
                    let id = sessionDictinary["id"] as! String?
                }
                
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

