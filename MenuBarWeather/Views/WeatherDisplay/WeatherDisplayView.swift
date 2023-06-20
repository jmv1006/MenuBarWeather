//
//  WeatherDisplayView.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/18/23.
//

import SwiftUI

struct WeatherDisplayView: View {
    @StateObject var viewModel: WeatherDisplayViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(String(viewModel.cityWeatherObject.name) + ", \(viewModel.cityWeatherObject.state)")
                    .font(.title)
                    .fontWeight(.bold)
            }
            VStack {
                Image(systemName: viewModel.cityWeatherObject.icon)
                    .resizable()
                    .frame(width: 50.0)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                Text(String(viewModel.cityWeatherObject.currentWeather.temperature) + "°F")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(String(viewModel.cityWeatherObject.currentWeather.weatherDescription))
            }
            .padding()
            Spacer()
        }
    }
}

struct WeatherDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDisplayView(viewModel: WeatherDisplayViewModel(cityWeatherObject: CityWeatherResponse(name: "Los Angeles", icon: "sun.max.fill", latitude: 12.5, longitude: 23.5, elevation: 2, currentWeather: CurrentWeather(temperature: 75.6, windspeed: 2.5, winddirection: 2, weathercode: 1, isDay: 1, time: "time", weatherDescription: "Cloudy"))))
            .frame(width: 200, height: 250)
            .padding()
    }
}
