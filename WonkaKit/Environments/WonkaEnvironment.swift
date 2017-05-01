//
//  WonkaEnvironment.swift
//  Pods
//
//  Created by Jordi Serra i Font on 30/4/17.
//
//

import BSWFoundation

public enum WonkaEnvironment: Environment {
    case develop
    public var basePath: String {
        switch self {
        case .develop:
            return "https://www.mockaroo.com/aaafc040"
        }
    }
}
