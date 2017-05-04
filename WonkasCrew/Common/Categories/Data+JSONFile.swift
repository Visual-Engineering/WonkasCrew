//
//  Data+JSONFile.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 4/5/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import Foundation

extension Data {
    init(fromJSONFileNamed fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let jsonStr = try? String(contentsOfFile: path),
            let data = jsonStr.data(using: .utf8, allowLossyConversion: false) else {
                fatalError()
        }
        
        self = data
    }
}
