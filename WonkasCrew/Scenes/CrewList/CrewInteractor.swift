//
//  CrewInteractor.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import BSWFoundation
import WonkaKit
import Deferred

protocol CrewInteractorType {
    func retrieveCrew(maxNumber: Int) -> Task<CrewViewModel>
}

class CrewInteractor: CrewInteractorType {
    
    let apiClient: APIClientType
    
    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }
    
    func retrieveCrew(maxNumber: Int) -> Task<CrewViewModel> {
        //TODO: implement this please
        
        return apiClient.retrieveCrew(maxNumber: maxNumber)
            ≈> CrewViewModel.viewModelTask
    }
}
