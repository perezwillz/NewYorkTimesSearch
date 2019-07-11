//
//  Link.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation

struct Link : Codable {
    let type : String?
    let url : String?
    let suggested_link_text : String?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case url = "url"
        case suggested_link_text = "suggested_link_text"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        suggested_link_text = try values.decodeIfPresent(String.self, forKey: .suggested_link_text)
    }
    
}
