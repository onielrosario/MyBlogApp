//
//  PhotoModel.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import Foundation


struct PhotoModel: Codable {
    let id: String
    let altDescription: String
    let urls: URLS
    
    private enum CodingKeys: String, CodingKey {
        case altDescription = "alt_description"
        case urls, id
    }
}

struct URLS: Codable {
    let regular: String
    let small: String
    let thumb: String
}
