//
//  NewYorkTimesTests.swift
//  NewYorkTimesTests
//
//  Created by Perez Willie-Nwobu on 7/8/19.
//  Copyright © 2019 Perez Willie-Nwobu. All rights reserved.
//

import XCTest
@testable import NewYorkTimes

class NewYorkTimesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
 
    
    func testJsonEnumeration(){
        XCTAssertEqual( .url, "https://api.nytimes.com/svc/movies/v2/reviews/search.json")
        XCTAssertEqual(.searchValue , "godfather")
        XCTAssertEqual( .apiKey,"76HRowLHO2J0QfPzCp4DAlBn9G1aHgjF")
        XCTAssertEqual( .reviewCollectionViewCellID, "reviewCellCellID")
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
