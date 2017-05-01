//
//  WonkasCrewTests.swift
//  WonkasCrewTests
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import XCTest
import WonkaKit
import Deferred
import BSWFoundation
@testable import WonkasCrew

private class InteractorFake: CrewInteractorType {
    public func retrieveCrew() -> Task<CrewViewModel> {
        return Task(success: CrewViewModel.fake)
    }
}

class WonkasCrewTests: SnapshotTestCase {
    
    func testJSONParsing() {
        guard let path = Bundle.main.path(forResource: "crew", ofType: "json"),
            let jsonStr = try? String(contentsOfFile: path),
            let data = jsonStr.data(using: .utf8, allowLossyConversion: false) else {
                fatalError()
        }
        
        let result: TaskResult<CrewListResponse> = JSONParser.parseData(data)
        switch result {
        case .success(let crewList):
            XCTAssert(crewList.crew.count == 10)
        default:
            XCTAssert(false)
        }
    }
    
    
    func testSnapshotOompaLoompaCell() {
        let cell = OompaLoompaCell(frame: .zero)
        cell.configureFor(viewModel: OompaLoompa.fake)
        cell.frame = CGRect(origin: .zero, size: CGSize(width: currentWindow.bounds.width, height: 50))
        
        debugView(cell)
    }
}
