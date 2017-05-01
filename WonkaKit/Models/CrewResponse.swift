//
//  CrewResponse.swift
//  Pods
//
//  Created by Jordi Serra i Font on 30/4/17.
//
//

import BSWFoundation
import Decodable

public enum Gender {
    case male
    case female
    
    init(_ string: String) {
        switch string {
        case "M":
            self = Gender.male
        default:
            self = Gender.female
        }
    }
}

public struct CrewListResponse {
    public let crew: [CrewResponse]
}

public struct CrewResponse {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String
    public let gender: Gender
    public let profession: String
    public let thumbnail: String
    public let image: String
}

extension CrewListResponse: Decodable {
    public static func decode(_ json: Any) throws -> CrewListResponse {
        let array = try NSArray.decode(json).map({ (obj) -> CrewResponse in
            let event = try CrewResponse.decode(json: obj)
            return event
        })
        
        return CrewListResponse(crew: array)
    }
}

extension CrewResponse: Decodable {
    public static func decode(_ json: Any) throws -> CrewResponse {
        return try CrewResponse(
            id: (json => "id") as! Int,
            firstName: (json => "first_name") as! String,
            lastName: (json => "last_name") as! String,
            email: (json => "email") as! String,
            gender: Gender(json => "gender" as! String),
            profession: (json => "profession") as! String,
            thumbnail: (json => "thumbnail") as! String,
            image: (json => "image") as! String
        )
    }
}





