//
//  MockNetwork.swift
//  AimeIOSChallenge
//
//  Created by Oniel Rosario on 10/16/20.
//

import Foundation
import Combine

enum NetworkError: Error {
    case failedResponse(Error)
    case decodingError(Error)
}

class NetworkManager<Response: Codable>{
    
    private let session: NetworkSession

    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    
    func loadData(
        endpoint: Endpoint,
        completionHandler: @escaping(Result<Response,NetworkError>) -> Void) {
        
        guard var components = URLComponents(url: URL(string: endpoint.url)!, resolvingAgainstBaseURL: true) else { return }
        components.queryItems = [URLQueryItem(name: "client_id", value: "LZlmulP9CdqmN5IZLpmP6vHz5bwJBeZ5HQYB9ws6hq8")]
        
        session.loadData(from: components.url!) { (data, error) in
            
            if let error = error {
                completionHandler(.failure(.failedResponse(error)))
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
