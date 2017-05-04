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
    public func retrieveCrew(maxNumber: Int) -> Task<CrewViewModel> {
        return Task(success: CrewViewModel.fake)
    }
}

private class APIClientSpy: APIClientType {
    
    var isCalled: Bool = false
    
    func retrieveCrew(maxNumber: Int) -> Task<CrewListResponse> {
        isCalled = true
        
        let result: TaskResult<CrewListResponse> = JSONParser.parseData(Data(fromJSONFileNamed: "crew"))
        guard let value = result.value else { fatalError() }
        return Task(success: value)
    }
}

class WonkasCrewTests: SnapshotTestCase {
    
    private let ANY_NUMBER: Int = 0
    
    func testJSONParsing() {
        let data = Data(fromJSONFileNamed: "crew")
        
        let result: TaskResult<CrewListResponse> = JSONParser.parseData(data)
        switch result {
        case .success(let crewList):
            XCTAssert(crewList.crew.count == 10)
        default:
            XCTAssert(false)
        }
    }
    
    func testCrewInteractor() {
        //Given
        let apiSpy = APIClientSpy()
        let interactor = CrewInteractor(apiClient: apiSpy)
        
        //When
        let crewTask = interactor.retrieveCrew(maxNumber: ANY_NUMBER)
        
        //Then
        XCTAssert(apiSpy.isCalled)
        
        let exp = expectation(description: "crew is received correctly")
        crewTask.upon(.main) { (result) in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTAssert(false)
            }
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    func testSnapshotOompaLoompaCell() {
        let cell = OompaLoompaCell(frame: CGRect(origin: .zero, size: CGSize(width: currentWindow.bounds.width, height: 50)))
        cell.configureFor(viewModel: OompaLoompa.fake)
        
        verifyView(cell)
    }
    
    func testSnapshotCrewViewController() {
        let vc = CrewListViewController()
        vc.interactor = InteractorFake()

        verifyViewController(vc)
    }
}
