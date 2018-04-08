//
//  User.swift
//  onTheMap
//
//  Created by Felipe Valdivia on 4/8/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

class User {
    
    var sessionID: String? = nil
    var uniqueKey: String? = nil
    var firstName: String? = nil
    var lastName: String? = nil
    
    static let sharedInstance = User()
    
}
