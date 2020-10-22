//
//  CellViewModel.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import Foundation
import Combine


class CellViewModel: ObservableObject {
    @Published var model: PhotoModel
    @Published var isFavorite: Bool
    
    init(model: PhotoModel) {
        self.model = model
        self.isFavorite = false
    }
    
    func addToFavorites() {
        
    }
}
