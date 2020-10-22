//
//  ImageAsset.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import Foundation
import UIKit

enum ImageAsset: String {
    case favorite
    case profile
    
}


// We can implement new fonts, color theme methods.
struct Asset {

    static func image(asset: ImageAsset) -> UIImage {
        return UIImage(named: asset.rawValue)!
    }
}
