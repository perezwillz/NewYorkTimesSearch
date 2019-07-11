//
//  Multimedia.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation

struct Multimedia : Codable {
    let type : String?
    let src : String?
    let width : Int?
    let height : Int?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case src = "src"
        case width = "width"
        case height = "height"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        src = try values.decodeIfPresent(String.self, forKey: .src)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
    }
    
}
