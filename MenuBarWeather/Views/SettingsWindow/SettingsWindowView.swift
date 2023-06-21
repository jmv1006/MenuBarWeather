//
//  SettingsWindowView.swift
//  MenuBarWeather
//
//  Created by Jonathan Andrade Valenzuela on 6/19/23.
//

import SwiftUI

struct SettingsWindowView: View {
    @StateObject var viewModel: SettingWindowViewModel
    
    var body: some View {
        VStack { 
            Text("Settings")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            VStack {
                Text("Default City")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    TextField(viewModel.defaultCity, text: $viewModel.userInput)
                    Button("Save", action: viewModel.updateDefaultCity)
                }
                
                Text("Saved Cities:")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                List {
                    /*
                        ForEach(viewModel.userDefaultsService.defaultsCities!, id: \.self) { city in
                            HStack {
                                Text(city)
                                Spacer()
                                Button("Make Default", action: { viewModel.enableCity(cityName: city)})
                                Button {
                                    // delete
                                    viewModel.deleteFromList(cityName: city)
                                } label: {
                                    Image(systemName: "minus")
                                }
                            }
                        }
                     */
                }
                Button("Clear", action: { })
            }
            .frame(alignment: .center)
            
            Spacer()
        }
        .frame(width: 250, height: 300)
        .padding()
    }
}

/*
 struct SettingWindow_Previews: PreviewProvider {
 static var previews: some View {
 SettingsWindowView(viewModel: SettingWindowViewModel(callAPI: { name in return }, defaultCities: ["San Juan"]))
 .frame(width: 250, height: 300)
 .padding()
 }
 }
 */
