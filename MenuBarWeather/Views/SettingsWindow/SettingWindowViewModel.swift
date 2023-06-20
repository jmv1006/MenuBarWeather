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
    
    func updateDefaultCity() {
        self.callAPI(userInput)
    }
    
    init(callAPI: @escaping (String) -> Void) {
        self.callAPI = callAPI
    }
}
