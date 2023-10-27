//
//  NetworkService.swift
//  RecipeBrowserApp
//
//  Created by Jonathan Kidney on 27/10/2023.
//

import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func request<T: Decodable>(_ endpoint: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(endpoint).responseDecodable(of: responseType) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

