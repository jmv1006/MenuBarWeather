//
//  API_Services.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/17/23.
//

import Foundation

// Gets the coordinates for a city given its name
func getGeoCoordinates(cityName: String, completionBlock: @escaping (GeoCoordinateCity) -> Void) {
    let url = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=\(cityName.replacingOccurrences(of: " ", with: "_"))&limit=5&appid=2ae9f6e3718dd2cebf6cbd59aede78eb")!
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        let decoder = JSONDecoder()
        do {
            let cities = try decoder.decode([GeoCoordinateCity].self, from: data!)
            
            guard cities.isEmpty else {
                // cities is empty
                completionBlock(cities[0])
                return
            }
            
            print("Cities is empty!")
            
        } catch {
            print(error)
        }
    })

    task.resume()
}

// gets the weather forecast for a city given a GeoCoordinateCity object
func getCityWeather(city: GeoCoordinateCity, completionBlock: @escaping (CityWeatherResponse) -> Void) {
    let latitude = String(city.lat!)
    let longitude = String(city.lon!)
    
    let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&daily=temperature_2m_max,temperature_2m_min&current_weather=true&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch&forecast_days=1&timezone=GMT")!
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        do {
            var cityWeatherResponse = try JSONDecoder().decode(CityWeatherResponse.self, from: data!)
            cityWeatherResponse.name = city.name!
            
            let weatherCode: Int = cityWeatherResponse.currentWeather.weathercode
            cityWeatherResponse.currentWeather.weatherDescription = weatherCodes[weatherCode]!
            
            let dayOrNight: Int = cityWeatherResponse.currentWeather.isDay
            let index: Int = dayOrNight == 1 ? 0 : 1
            let weatherIcon: String = weatherIcons[weatherCode]![index]
            cityWeatherResponse.icon = weatherIcon
            
            if city.state != "" && city.state != nil {
                if let stateAbbreviation = statesDictionary[city.state!] {
                    cityWeatherResponse.state = stateAbbreviation
                }
            }
            
            completionBlock(cityWeatherResponse)
        } catch {
            print(error)
        }
       
    })

    task.resume()
}
