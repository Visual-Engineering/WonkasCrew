//
//  APIClient.swift
//  Pods
//
//  Created by Jordi Serra i Font on 30/4/17.
//
//

import BSWFoundation
import Deferred

public protocol APIClientType {
    func retrieveCrew(maxNumber: Int) -> Task<CrewListResponse>
}

public enum CurrentEnvrionment {
    static public let envrionment: WonkaEnvironment = .develop
}

open class APIClient: APIClientType {
    
    open static let client = APIClient()
    fileprivate let drosky = Drosky(environment: CurrentEnvrionment.envrionment)
    static let queue = queueForSubmodule("APIClient")
    
    private init() {}
    
    public func retrieveCrew(maxNumber: Int) -> Task<CrewListResponse> {
        return drosky.performRequest(forEndpoint: WonkaEndpoint.crew(maxNumber: maxNumber))
            ≈> CrewListResponse.fromDroskyResponse
    }
}
