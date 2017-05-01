//
//  ModuleConstants.swift
//  Pods
//
//  Created by Jordi Serra i Font on 30/4/17.
//
//

import Foundation


let ModuleName = "com.visualengin.wonkacrew"

func submoduleName(_ submodule : String) -> String {
    return ModuleName + "." + submodule
}

public func queueForSubmodule(_ submodule : String, qualityOfService: QualityOfService = .default) -> OperationQueue {
    let queue = OperationQueue()
    queue.name = submoduleName(submodule)
    queue.qualityOfService = qualityOfService
    return queue
}
