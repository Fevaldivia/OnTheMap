//
//  TabBarActions.swift
//  onTheMap
//
//  Created by Felipe Valdivia on 4/7/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import UIKit

class TabBarActions: UITabBarController {
    // Nav bar actions for TabBar controller
    
    // MARK: Logout function
    @IBAction func finishUserSession(_ sender: Any) {
        var request = URLRequest(url: URL(string: "https://www.udacity.com/api/session")!)
        request.httpMethod = "DELETE"
        var xsrfCookie: HTTPCookie? = nil
        let sharedCookieStorage = HTTPCookieStorage.shared
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
        }
        if let xsrfCookie = xsrfCookie {
            request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error…
                return
            }
            let range = Range(5..<data!.count)
            let newData = data?.subdata(in: range) /* subset response data! */
            print(String(data: newData!, encoding: .utf8)!)
            performUIUpdatesOnMain {
                self.loggedOut()
            }
        }
        task.resume()
    }
    
    private func loggedOut() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "LoginController")
        present(controller, animated: true, completion: nil)
    }
    
}
