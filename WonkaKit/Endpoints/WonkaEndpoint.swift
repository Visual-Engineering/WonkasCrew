//
//  WonkaEndpoints.swift
//  Pods
//
//  Created by Jordi Serra i Font on 30/4/17.
//
//

import BSWFoundation
import Deferred
import Decodable

enum WonkaEndpoint {
    case crew(maxNumber: Int)
}

extension WonkaEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .crew:
            return "/download"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .crew:
            return .GET
        }
    }
    
    var parameters: [String : AnyObject]? {
        switch self {
        case .crew(let maxNumber):
            return [
                "count" : maxNumber as AnyObject,
                "key" : "aa8685c0" as AnyObject
            ]
        }
    }
    
    var httpHeaderFields: [String : String]? {
        return nil
    }
}

extension CrewListResponse: DroskyDecodable {}

public enum WonkaError: Error {
    case badRequest
    case malformedResponse
    case unknownError(String?)
}
