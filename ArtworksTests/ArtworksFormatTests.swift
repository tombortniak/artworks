//
//  ArtworksFormatTests.swift
//  ArtworksTests
//
//  Created by Tomasz Bortniak on 23/10/2023.
//

import XCTest
@testable import Artworks

final class ArtworksFormatTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func test_getSpan_withEqualStartAndEndYear_shouldReturnSingleYear() {
        let startYear = 1410
        let endYear = 1410
        let expectedSpan = "1410"
        let span = getSpan(startYear: startYear, endYear: endYear)
        XCTAssertEqual(span, expectedSpan)
    }

    func test_getSpan_withEndYear_shouldReturnFullSpan() {
        let startYear = 1505
        let endYear = 1519
        let expectedSpan = "1505 - 1519"
        let span = getSpan(startYear: startYear, endYear: endYear)
        XCTAssertEqual(span, expectedSpan)
    }

    func test_getSpan_withoutEndYear_shouldReturnPartialSpan() {
        let startYear = 1505
        let expectedSpan = "1505 - ?"
        let span = getSpan(startYear: startYear, endYear: nil)
        XCTAssertEqual(span, expectedSpan)
    }

    func test_getSpan_withNegativeStartYearAndWithoutEndYear_shouldReturnPartialSpan() {
        let startYear = -1129
        let expectedSpan = "1129 BC - ?"
        let span = getSpan(startYear: startYear, endYear: nil)
        XCTAssertEqual(span, expectedSpan)
    }

    func test_getSpan_withNegativeStartYear_shouldReturnFullSpan() {
        let startYear = -80
        let endYear = 907
        let expectedSpan = "80 BC - 907"
        let span = getSpan(startYear: startYear, endYear: endYear)
        XCTAssertEqual(span, expectedSpan)
    }

    func test_getSpan_withBothNegativeYears_shouldReturnFullSpan() {
        let startYear = -1760
        let endYear = -1321
        let expectedSpan = "1760 BC - 1321 BC"
        let span = getSpan(startYear: startYear, endYear: endYear)
        XCTAssertEqual(span, expectedSpan)
    }

    func test_getDimensions_withHeightAndWidth_shouldReturnFullDimensionsInCentimeters() {
        let height = 500.0
        let width = 450.0
        let expectedDimensions = "500 cm x 450 cm"
        let dimensions = getDimensions(height: height, width: width)
        XCTAssertEqual(dimensions, expectedDimensions)
    }

    func test_getDimensions_withoutWidth_shouldReturnHeight() {
        let height = 500.0
        let expectedDimensions = "500 cm"
        let dimensions = getDimensions(height: height, width: nil)
        XCTAssertEqual(dimensions, expectedDimensions)
    }

    func test_getDimensions_withoutAnyDimensions_shouldReturnEmptyDimensions() {
        let expectedDimensions = "-"
        let dimensions = getDimensions(height: nil, width: nil)
        XCTAssertEqual(dimensions, expectedDimensions)
    }

    func test_getDimensions_withBothDimensions_shouldReturnFullDimensions() {
        let height = 654.0
        let width = 800.0
        let expectedDimensions = "654 cm x 800 cm"
        let dimensions = getDimensions(height: height, width: width)
        XCTAssertEqual(dimensions, expectedDimensions)
    }

}
