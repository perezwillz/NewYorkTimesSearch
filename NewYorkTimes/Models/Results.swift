//
//  Results.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
struct Results : Codable {
    let display_title : String?
    let mpaa_rating : String?
    let critics_pick : Int?
    let byline : String?
    let headline : String?
    let summary_short : String?
    let publication_date : String?
    let opening_date : String?
    let date_updated : String?
    let link : Link?
    let multimedia : Multimedia?
    
    enum CodingKeys: String, CodingKey {
        
        case display_title = "display_title"
        case mpaa_rating = "mpaa_rating"
        case critics_pick = "critics_pick"
        case byline = "byline"
        case headline = "headline"
        case summary_short = "summary_short"
        case publication_date = "publication_date"
        case opening_date = "opening_date"
        case date_updated = "date_updated"
        case link = "link"
        case multimedia = "multimedia"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        display_title = try values.decodeIfPresent(String.self, forKey: .display_title)
        mpaa_rating = try values.decodeIfPresent(String.self, forKey: .mpaa_rating)
        critics_pick = try values.decodeIfPresent(Int.self, forKey: .critics_pick)
        byline = try values.decodeIfPresent(String.self, forKey: .byline)
        headline = try values.decodeIfPresent(String.self, forKey: .headline)
        summary_short = try values.decodeIfPresent(String.self, forKey: .summary_short)
        publication_date = try values.decodeIfPresent(String.self, forKey: .publication_date)
        opening_date = try values.decodeIfPresent(String.self, forKey: .opening_date)
        date_updated = try values.decodeIfPresent(String.self, forKey: .date_updated)
        link = try values.decodeIfPresent(Link.self, forKey: .link)
        multimedia = try values.decodeIfPresent(Multimedia.self, forKey: .multimedia)
    }
    
}
