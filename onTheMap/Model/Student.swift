//
//  Student.swift
//  onTheMap
//
//  Created by Felipe Valdivia on 4/8/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import Foundation

struct StudentInformation {
    // MARK: Properties
    let objectId: String
    let uniqueKey: String
    let firstName: String
    let lastName: String
    let mapString: String
    let mediaURL: String
    let latitude: Float
    let longitude: Float
    let createdAt: NSString
    let updatedAt: NSString
    
    // MARK: Initializers
    
    init(dictionary: [String:AnyObject]) {
        firstName = dictionary[ApiClient.PARSEResponseKeys.firstName] as? String ?? "firstName"
        lastName = dictionary[ApiClient.PARSEResponseKeys.lastName] as? String ?? "firstName"
        mapString = dictionary[ApiClient.PARSEResponseKeys.mapString] as? String ?? ""
        mediaURL = dictionary[ApiClient.PARSEResponseKeys.mediaURL] as? String ?? ""
        latitude = dictionary[ApiClient.PARSEResponseKeys.latitude] as? Float ?? 0.0
        longitude = dictionary[ApiClient.PARSEResponseKeys.longitude] as? Float ?? 0.0
        objectId = dictionary[ApiClient.PARSEResponseKeys.objectID] as? String ?? ""
        uniqueKey = dictionary[ApiClient.PARSEResponseKeys.uniqueKey] as? String ?? ""
        createdAt = dictionary[ApiClient.PARSEResponseKeys.createdAt] as? NSString ?? ""
        updatedAt = dictionary[ApiClient.PARSEResponseKeys.updatedAt] as? NSString ?? ""
    }
    
    static func studentFromResult(results: [[String: AnyObject]]) -> [StudentInformation]{
        var students = [StudentInformation]()
        
        for result in results {
            students.append(StudentInformation(dictionary: result))
        }
        
        return students
    }
    
    
}
