//
//  MenuBarWeatherApp.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/17/23.
//

import SwiftUI

@main
struct MenuBarWeatherApp: App {
    @AppStorage("defaultCity") var defaultCity: String = "Los Angeles"
    @State var currentCityWeatherData: CityWeatherResponse? = nil
    
    var body: some Scene {
        Settings {
            SettingsWindowView(viewModel: SettingWindowViewModel(callAPI: callAPI))
        }
        
        MenuBarExtra("Weather", systemImage: "cloud.sun.fill") {
           ContentView(callAPI: callAPI, currentCityWeatherData: $currentCityWeatherData, defaultCity: $defaultCity)
        }
        .menuBarExtraStyle(.window)
    }
    
    func callAPI(cityName: String) {
        currentCityWeatherData = nil
        
        getGeoCoordinates(cityName: cityName, completionBlock: { city in
            getCityWeather(city: city, completionBlock: { cityWeather in
                currentCityWeatherData = cityWeather
                defaultCity = cityWeather.name
            })
        })
    }
}
