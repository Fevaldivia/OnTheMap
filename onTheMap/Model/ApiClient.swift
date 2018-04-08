//
//  UdacityClient.swift
//  onTheMap
//
//  Created by Felipe Valdivia on 3/31/18.
//  Copyright © 2018 Felipe Valdivia. All rights reserved.
//

import Foundation

struct ApiClient {
    // Udacity Session API
    struct SessionAPI{
        static let AuthorizationURL = "https://www.udacity.com/api/session"
    }
    
    // PARSE API
    struct ParseAPI {
        static let ApplicationID = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let APIKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
    }
    
    struct PARSEResponseKeys {
        static let objectID = "objectId"
        static let uniqueKey = "uniqueKey"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let mapString = "mapString"
        static let mediaURL = "mediaURL"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let createdAt = "createdAt"
        static let updatedAt = "updatedAt"
    }
    
}
