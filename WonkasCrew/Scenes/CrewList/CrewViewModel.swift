//
//  CrewViewModel.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import UIKit
import WonkaKit
import Deferred

enum Imageable {
    case ui(UIImage)
    case url(String)
}

struct CrewViewModel {
    let crew: [OompaLoompa]
}

struct OompaLoompa {
    let image: Imageable
    let thumbnail: UIImage
    let name: String
    let role: String
}

extension CrewViewModel: PresenterType {
    
    init(fromResponse response: CrewListResponse) {
        self.crew = response.crew.map({ oompa -> OompaLoompa in
            guard let url = URL(string: oompa.thumbnail),
                let data = try? Data(contentsOf: url),
                let thumbnail = UIImage(data: data) else {
                    fatalError()
            }
            
            return OompaLoompa(
                image: .url(oompa.image),
                thumbnail: thumbnail,
                name: "\(oompa.firstName) \(oompa.lastName)",
                role: oompa.profession
            )
        })
    }
}
