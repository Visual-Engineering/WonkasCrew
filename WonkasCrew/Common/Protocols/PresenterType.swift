//
//  PresenterType.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 1/5/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import Foundation
import Deferred

protocol Presentable {
    associatedtype Response
    static func viewModelTask(fromResponse response: Response) -> Task<Self>
    init(fromResponse response: Response)
}

extension Presentable {
    static func viewModelTask(fromResponse response: Response) -> Task<Self> {
        let deferred = Deferred<TaskResult<Self>>()
        deferred.fill(with: .success(Self(fromResponse: response)))
        return Task(future: Future(deferred))
    }
}
