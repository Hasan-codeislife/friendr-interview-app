//
//  RootService.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation
protocol RootServiceProtocol {
    func fetchFromWikipedia(completion: @escaping(Result<Data, Error>) -> Void)
}

final class RootService: RootServiceProtocol {
    
    private var apiClient: APIClientProtocol
    
    init(client: APIClientProtocol) {
        self.apiClient = client
    }
    
    func fetchFromWikipedia(completion: @escaping(Result<Data, Error>) -> Void) {
        let endPoint = RootEndPoint.fetchFromWikipedia
        guard let url = URL(string: endPoint.path) else { return }
        let urlRequest = URLRequest(url: url)
        apiClient.dataTask(urlRequest) { response in
            switch response {
            case .success(let serverResponse):
                completion(.success(serverResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension RootService {
    static func create() -> RootService {
        return RootService(client: APIClientURLSession())
    }
}
