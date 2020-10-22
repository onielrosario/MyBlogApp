//
//  ContentViewModel.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/20/20.
//

import Combine
import Foundation

class FeedViewModel: ObservableObject {
    @Published var photoCollection: [PhotoModel] = []
    
    init() {
        NetworkManager<[PhotoModel]>().loadData(endpoint: Endpoint.photos) { (result) in
            switch result {
            case .success(let collection):

                DispatchQueue.main.async {
                    self.photoCollection = collection
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}


