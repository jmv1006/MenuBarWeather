//
//  WeatherDisplayViewModel.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/18/23.
//

import Foundation

class WeatherDisplayViewModel: ObservableObject {
    @Published var cityWeatherObject: CityWeatherResponse
    
    init(cityWeatherObject: CityWeatherResponse) {
        self.cityWeatherObject = cityWeatherObject
    }
    
    
}
