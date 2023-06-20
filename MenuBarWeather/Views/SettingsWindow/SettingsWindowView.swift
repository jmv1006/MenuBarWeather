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
            }
            .frame(alignment: .center)
            
            Spacer()
        }
        .frame(width: 250, height: 300)
        .padding()
    }
}

