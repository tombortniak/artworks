//
//  ArtworksAPITests.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 19/08/2023.
//

import XCTest
@testable import Artworks

final class ArtworksAPITests: XCTestCase {
    var artworksAPI: ArtworksAPI!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        artworksAPI = ArtworksAPI()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func test_appending_withCorrectParameter_shouldReturnCorrectURL() throws {
        let queryParameters = ["testParam": "testValue"]
        let result = try artworksAPI.appending(queryParameters: queryParameters, to: Constants.API.artistsURL!)
        XCTAssertEqual(result, URL(string:"\(Constants.API.artistsURL!)?testParam=testValue"))
    }

    func test_appending_withCorrectParameters_shouldReturnCorrectURL() throws {
        let queryParameters = ["testParam1": "testValue1", "testParam2": "testValue2"]
        let result = try artworksAPI.appending(queryParameters: queryParameters, to: Constants.API.artistsURL!)
        XCTAssertEqual(result, URL(string:"\(Constants.API.artistsURL!)?testParam1=testValue1&testParam2=testValue2"))
    }

    func test_appending_withIncorrectParameterKey_shouldThrowError() throws {
        let queryParameters = ["": "testValue"]
        XCTAssertThrowsError(try artworksAPI.appending(queryParameters: queryParameters, to: Constants.API.artistsURL!))

    }

    func test_appending_withIncorrectParameterValue_shouldThrowError() throws {
        let queryParameters = ["testParam": ""]
        XCTAssertThrowsError(try artworksAPI.appending(queryParameters: queryParameters, to: Constants.API.artistsURL!))
    }
}
