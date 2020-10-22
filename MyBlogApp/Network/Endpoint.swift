//
//  Endpoint.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import Foundation


//If in future a path on the endpoint is required,
//We would add new case and append the path to the base URL

enum Endpoint {
    case photos
    case mock
    
    var url: String {
        switch self {
        case .photos:
            return "https://api.unsplash.com/photos/"
        case .mock:
            return "www.mock.test"
        }
    }
}
