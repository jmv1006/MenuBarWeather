//
//  MenuBarWeatherApp.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/17/23.
//

import SwiftUI

@main
struct MenuBarWeatherApp: App {
    @StateObject var userDefaultsService: UserDefaultsService = UserDefaultsService()
    
    @AppStorage("defaultCity") var defaultCity: String = "Los Angeles"
    @State var currentCityWeatherData: CityWeatherResponse? = nil
    @State var savedCities: [String]? = []
    
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

/*
 func handleSavedCities(action: String) {
     switch action {
         case "set":
             userDefaults.set(savedCities, forKey: "savedCities")
         case "get":
             let defaultsCities: [String]? = userDefaults.array(forKey: "savedCities") as? [String]
             if(defaultsCities != nil) {
                 savedCities = defaultsCities!
             }
         case "delete":
             UserDefaults.standard.removeObject(forKey: "savedCities")
             savedCities = [String]()
         default:
             return
     }
 }
 */
