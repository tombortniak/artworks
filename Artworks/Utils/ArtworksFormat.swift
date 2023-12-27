//
//  ArtworksFormat.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 23/10/2023.
//

import Foundation

private func getYearString(from year: Int) -> String {
    var yearString = String(abs(year))
    if year < 0 {
        yearString += " BC"
    }
    return yearString
}

func getSpan(startYear: Int, endYear: Int?) -> String {
    guard startYear != endYear else {
        return getYearString(from: startYear)
    }
    var span = "\(getYearString(from: startYear)) - ?"
    if endYear != nil {
        let str = span
        span = str.replacingOccurrences(of: "?", with: getYearString(from: endYear!))
    }
    return span
}

func getDimensions(height: Double?, width: Double?) -> String {
    guard height != nil || width != nil else {
        return "-"
    }
    let formatter = MeasurementFormatter()
    formatter.numberFormatter.maximumFractionDigits = 1
    formatter.unitOptions = .providedUnit
    var dimensions = ""
    if height != nil {
        let measurement = Measurement(value: height!, unit: Constants.Format.lengthUnit)
        dimensions = formatter.string(from: measurement)
    }
    if width != nil {
        let measurement = Measurement(value: width!, unit: Constants.Format.lengthUnit)
        dimensions += " x \(formatter.string(from: measurement))"
    }
    return dimensions
}
