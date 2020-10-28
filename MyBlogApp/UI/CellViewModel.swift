//
//  CellViewModel.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import SwiftUI
import Combine
import KingfisherSwiftUI
import Kingfisher
import UIKit


class CellViewModel: ObservableObject {
    @Published var model: PhotoModel
    @Published var isExpanded = false
    @Published var doubleExpanded = false
    @Published var offset = OffsetState.first
    @Published var mode = CellType.front
    @Published var image: KFImage
    @Published var imageColor: UIColor?
    
    init(model: PhotoModel) {
        self.model = model
        self.image = KFImage(URL(string: model.urls.small))
        DispatchQueue.main.async {
            self.getUIImageFromModel()
        }
    }
    
    func addToFavorites() {
        print("favorites")
    }
    
    func like() {
        print("like")
    }
    
    func comment() {
            doubleExpanded.toggle()
            offset = doubleExpanded ? .third : .second
            mode = doubleExpanded ? .back : .front
    }
}

extension CellViewModel {
    func getUIImageFromModel() {
      let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: model.urls.small))
        let color = imageView.image?.averageColor
        imageColor = color
    }
}
