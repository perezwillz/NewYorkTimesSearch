//
//  ReviewViewModel.swift
//  NewYorkTimes
//
//  Created by Perez Willie-Nwobu on 7/10/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import Foundation
import UIKit

class ReviewViewModel {
    
    private static var internalResult: [Results] = []
    private static var internalImages: [Int: UIImage?] = [:]
    
    
    static var result: [Results] {
        return internalResult
    }
    
    static var images: [Int: UIImage?] {
        return internalImages
    }
    
    static func getReviews(completion: @escaping (NetworkManager.Errors?) -> Void) {
        NetworkManager.fetchReviews { (data, error) in
            if let error = error {
                completion(.dataTaskError(error: error))
            }
            guard let data = data else {
                completion(.noDataReturned)
                return
            }
           
            do {
                let base = try JSONDecoder().decode(Base.self, from: data)
                print(base.copyright)
                internalResult = base.results
                completion(nil)
            } catch {
                completion(.decodingDataFailed)
                return
            }
        }
    }
    
}
