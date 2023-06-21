//
//  SettingWindowViewModel.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/19/23.
//

import Foundation
import SwiftUI

class SettingWindowViewModel: ObservableObject {
    @AppStorage("defaultCity") var defaultCity: String = "Los Angeles"
    @Published var userInput: String = ""
    
    var callAPI: (String) -> Void
    
    
    init(callAPI: @escaping (String) -> Void) {
        self.callAPI = callAPI
    }
    
    func updateDefaultCity() {
        self.callAPI(userInput)
    }
    
    func enableCity(cityName: String) {
        self.callAPI(cityName)
    }
    
    func deleteFromList(cityName: String) {
        //savedCities = savedCities.filter { $0 != cityName }
    }
}
