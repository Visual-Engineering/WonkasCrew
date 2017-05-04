//
//  CrewViewModel+Fake.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import BSWFoundation
@testable import WonkasCrew

extension CrewViewModel {
    public static var fake: CrewViewModel {
        return CrewViewModel(crew: [
            OompaLoompa.fake,
            OompaLoompa.fake,
            OompaLoompa.fake
            ])
    }
}

extension OompaLoompa {
    public static var fake: OompaLoompa {
        
        guard let url = URL(string: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALcSURBVDjLjZFpMNRxGMfVi17UNL3qRdcLRI2jiUgyHdp6ozIlco3Whm1c49gwmyNndGBtLB3uRdPuCrOtnWoPokGMs5WwMth1S9q/Y+PbzjaJqTFefOb34jffzzPP99EBoLMRUY57KZ3ZBrPDJfsgL9BV5wfp5dpb6W37879hOMhuP2mgWHd5pHQP1vLEX5+xKUEueTdzpNwCCqEPiIZUKHg2GCk7gK5s/ZlNCViOu1KVbULM1rOgbivE3AcWhlsFkCSYDWxK4GB3nSpjh658b+diubscqq4KKKVMxN84y/uvgGprQMminJtletiC5UlS+zqbNjMj/JeUPBqGKuOgrIpGXU4AjvgYCyzDTHasE5BtDpKyKOeXGe62WEteehC4pRFo5nshmUFD5Sc2kiTxMI05VHCUZrh9VZDubF731PcKymO9ICuNQgnNCUwPEp4HXECnmIypXg6E0ptIaQkF53MugisCYe1ryVoVZDrrc3olZf8UVpNzERPdbKh/9KGj8hrS6r1Bb/QDheUJOct+48JGxClo517FwgQfC4o0TPe/hqTKGeF8P7ilu0Hx7NJfwdZjGfRMeuC6wlrZLpjs4WJhKB61KcewNMVFax4JIY9OjYVRY2Pl+a7u2vAWmxfeDrSWOekocO8lD9F5ZWDkJGNAFInF8SIQfRTUJpthfjAC3+QCNGWelDVmnNipvYKuXY6TUxBfVdW9jEQZ4NMEUCRqVBf5YkZT3PzX21B9cflNr4dmFQYGa5iof2AeoxV0JFr8bOY+Bu2VEmQhQK5YwcPCcgzWpmFxNFs7XdXrrlnBXPsScj8QykrUJpiO1cQZG+kMZJxRcJNC4BrTAOobzfRqQJx5GcRkPxanRVgY13QwzlkDD+q5Lgw3sCGONOTo9BTfshbEO9yxcmJXWAR/hG1MB97ePw1J8nGIkywhijNbkcaZqKV3jRYl0YcJTYgQ0Q0IUYQ+8S5c7/0vfNrCXhlwpm0AAAAASUVORK5CYII="),
            let data = try? Data(contentsOf: url),
            let thumbnail = UIImage(data: data) else {
            fatalError()
        }
        
        return OompaLoompa(
            image: .url("https://robohash.org/ullamaccusantiumaut.jpg?size=800x600&set=set1"),
            thumbnail: thumbnail,
            name: "Gerik Hillan",
            role: "Metalworker")
    }
}
