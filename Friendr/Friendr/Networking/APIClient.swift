//
//  APIClient.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation

protocol APIClientProtocol {
    func dataTask(_ request: URLRequest,
                  completionHandler: @escaping (Result<Data, Error>) -> Void)
}

final class APIClientURLSession: APIClientProtocol {
    func dataTask(_ request: URLRequest,
                  completionHandler: @escaping (Result<Data, Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                completionHandler(.success((data)))
            } else {
                let error = error ?? NSError()
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
