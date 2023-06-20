//
//  ContentView.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    var callAPI: (String) -> Void
    @Binding var currentCityWeatherData: CityWeatherResponse?
    @Binding var defaultCity: String
    
    var body: some View {
        VStack {
            if currentCityWeatherData != nil {
                WeatherDisplayView(viewModel: WeatherDisplayViewModel(cityWeatherObject: currentCityWeatherData!))
                HStack {
                    Button("Settings", action: { NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil) })
                }
            } else {
                ProgressView()
            }
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
        .onAppear(perform: {callAPI(defaultCity)})
        .frame(width: 200, height: 250)
        .padding()
    }
    
}

/*
 struct ContentView_Previews: PreviewProvider {
 
 static var previews: some View {
 // ContentView()
 }
 }
 */
