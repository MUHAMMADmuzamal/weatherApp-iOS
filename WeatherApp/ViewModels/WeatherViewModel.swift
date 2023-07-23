//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Muhammad muzamal on 20/07/2023.
//

import Foundation
@MainActor
class WeatherViewModel: ObservableObject{
    @Published var weather: Weather?
    private var weatherRepository: WeatherRepository
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func fetchWeatherData() async throws{
        
        do{
            weather = try await weatherRepository.fetchData()
            
        }catch{
            print("\(error)")
        }
        
    }
    func currentWeather() -> String {
        return weather != nil ? "\(Int(weather!.currentWeather.temperature))\u{00B0}" : "---"
    }
}
