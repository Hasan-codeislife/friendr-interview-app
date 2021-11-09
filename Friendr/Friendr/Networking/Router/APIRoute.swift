//
//  APIRoute.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation
enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

typealias APIParams = [String: Any]?
typealias APIMehtod = APIMethod


/// This should be implemented by all concrete routers
protocol Routable {

    /// by default method is HTTPMethod.get
    var method: APIMehtod { get }

    /// path should be appended with baseURL
    var path: String { get }
    var params: APIParams? { get }
}
