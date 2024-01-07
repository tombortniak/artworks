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

    func test_getArtworks_withCorrectParameter_shouldReturnData() async throws {
        let queryParameters = ["testParam": "testValue"]
        let data = try await artworksAPI.getArtworks(queryParameters: queryParameters)
        XCTAssertNotNil(data)
    }

    func test_getArtworks_withCorrectParameters_shouldReturnData() async throws {
        let queryParameters = ["testParam1": "testValue1", "testParam2": "testValue2"]
        let data = try await artworksAPI.getArtworks(queryParameters: queryParameters)
        XCTAssertNotNil(data)
    }

    func test_getArtworks_withIncorrectParameterKey_shouldThrowError() async throws {
        let queryParameters = ["": "testValue"]
        var didFailWithError: ArtworksAPIError?
        do {
            _ = try await artworksAPI.getArtworks(queryParameters: queryParameters)
        } catch ArtworksAPIError.invalidQuery {
            didFailWithError = ArtworksAPIError.invalidQuery
        }
        XCTAssertNotNil(didFailWithError)
    }

    func test_getArtworks_withIncorrectParameterValue_shouldThrowError() async throws {
        let queryParameters = ["": "testValue"]
        var didFailWithError: Error?
        do {
            _ = try await artworksAPI.getArtworks(queryParameters: queryParameters)
        } catch ArtworksAPIError.invalidQuery {
            didFailWithError = ArtworksAPIError.invalidQuery
        }
        XCTAssertNotNil(didFailWithError)
    }

    func test_getArtwork_withCorrectId_shouldThrowError() async throws {
        let expectation = XCTestExpectation(description: "Don't throw error when provided valid id")
        let id = 1
        _ = try await artworksAPI.getArtwork(id: id)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 5.0)
    }

    func test_getArtwork_withIncorrectId_shouldReturnData() async throws {
        let expectation = XCTestExpectation(description: "Throw error when provided invalid id")
        let id = -1
        do {
            let _ = try await artworksAPI.getArtwork(id: id)
        } catch {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 5.0)
    }
}
