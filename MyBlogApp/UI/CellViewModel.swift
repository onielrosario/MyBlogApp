//
//  CellViewModel.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import Foundation
import Combine
import KingfisherSwiftUI


class CellViewModel: ObservableObject {
    @Published var model: PhotoModel
    @Published var isExpanded = false
    @Published var doubleExpanded = false
    @Published var offset = OffsetState.first
    @Published var mode = CellType.front
    @Published var image: KFImage
    
    init(model: PhotoModel) {
        self.model = model
        self.image = KFImage(URL(string: model.urls.small))
    }
    
    func addToFavorites() {
        print("favorites")
    }
    
    func like() {
        print("like")
    }
}
