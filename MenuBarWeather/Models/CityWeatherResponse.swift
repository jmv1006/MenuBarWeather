// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cityWeatherResponse = try? JSONDecoder().decode(CityWeatherResponse.self, from: jsonData)

import Foundation

// MARK: - CityWeatherResponse
struct CityWeatherResponse: Codable {
    var name: String = ""
    var state: String = ""
    var icon: String = ""
    let latitude, longitude: Double
    let elevation: Int
    var currentWeather: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case elevation
        case currentWeather = "current_weather"
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let temperature, windspeed: Double
    let winddirection, weathercode, isDay: Int
    let time: String
    var weatherDescription: String = ""

    enum CodingKeys: String, CodingKey {
        case temperature, windspeed, winddirection, weathercode
        case isDay = "is_day"
        case time
    }
}

