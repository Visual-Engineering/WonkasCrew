//
//  XCTestCase+JSONData.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 4/5/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import XCTest
import Foundation

extension Data {
    init(contentsOfJSONFile file: String, bundle: Bundle) {
        guard let path = bundle.path(forResource: file, ofType: "json"),
            let jsonStr = try? String(contentsOfFile: path),
            let data = jsonStr.data(using: .utf8, allowLossyConversion: false) else {
                fatalError()
        }
        
        self = data
    }
}
