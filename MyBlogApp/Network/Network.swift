//
//  MockNetwork.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/16/20.
//

import Foundation
import Combine

protocol NetworkSession {
    func loadData(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}


extension URLSession: NetworkSession {
    func loadData(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        dataTask(with: url) { (data, _, error) in
            completionHandler(data,error)
        }.resume()
    }
    
}

class MockNetwork: NetworkSession {
    var data: Data?
    var error: Error?
    
    func loadData(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data,error)
    }
}


