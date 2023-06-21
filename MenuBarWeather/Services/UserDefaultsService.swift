//
//  UserDefaultsService.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/20/23.
//

import Foundation

class UserDefaultsService: ObservableObject {
    let userDefaults = UserDefaults.standard
    @Published var defaultsCities: [String]? = UserDefaults.standard.array(forKey: "savedCities") as? [String]
    
    func getDefaultCities() -> [String]? {
        return UserDefaults.standard.array(forKey: "savedCities") as? [String]
    }
    
    func appendToDefaultCities(cityName: String) {
        userDefaults.set(defaultsCities, forKey: "savedCities")
    }
    
    func deleteDefaultCities() -> Void {
        UserDefaults.standard.removeObject(forKey: "savedCities")
    }
    
}
