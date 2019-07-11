//
//  Base.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
struct Base : Codable {
    let status : String?
    let copyright : String?
    let has_more : Bool?
    let num_results : Int?
    let results : [Results]
   
}
