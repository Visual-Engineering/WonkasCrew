//
//  DroskyDecodable.swift
//  Pods
//
//  Created by Jordi Serra i Font on 1/5/17.
//
//

import Foundation
import Decodable
import BSWFoundation
import Deferred

protocol DroskyDecodable {
    static func fromDroskyResponse(_ droskyResponse: DroskyResponse) -> Task<Self>
}

extension DroskyDecodable where Self: Decodable {
    
    static func fromDroskyResponse(_ droskyResponse: DroskyResponse) -> Task<Self> {
        let deferred = Deferred<TaskResult<Self>>()
        
        APIClient.queue.addOperation {
            switch droskyResponse.statusCode {
            case 200:
                deferred.fill(with: attemptToParseResponse(droskyResponse.data))
            case 400:
                deferred.fill(with: .failure(WonkaError.badRequest))
            default:
                let errorMessage = JSONParser.errorMessageFromData(droskyResponse.data)
                deferred.fill(with: .failure(WonkaError.unknownError(errorMessage)))
            }
        }
        
        return Task(future: Future(deferred))
    }
    
    static private func attemptToParseResponse(_ data: Data, newRegister: Bool = false) -> TaskResult<Self> {
        let parseResult: TaskResult<Self> = JSONParser.parseData(data)
        switch parseResult {
        case .success(let response):
            return .success(response)
        case .failure(_):
            return .failure(WonkaError.malformedResponse)
        }
    }
}
