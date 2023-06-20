//
//  GeoCoordinateResponse.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/18/23.
//

import Foundation

struct GeoCoordinateCity: Codable {
    var name: String?
    var lat: Float?
    var lon: Float?
    var country: String?
    var state: String?
}
