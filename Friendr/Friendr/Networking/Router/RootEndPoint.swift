//
//  RootEndPoint.swift
//  Friendr
//
//  Created by Hassan Asim on 09/11/2021.
//

import Foundation

enum RootEndPoint: Routable {
    case fetchFromWikipedia
    
    var path: String {
        switch self {
        case .fetchFromWikipedia:
            return "https://en.wikipedia.org/wiki/Banana"
        }
    }
    
    var params: APIParams? {
        return nil
    }
    
    var method: APIMehtod {
        switch self {
        case .fetchFromWikipedia:
            return .get
        }
    }
}
