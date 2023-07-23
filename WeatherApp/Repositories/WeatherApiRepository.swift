//
//  WeatherApiRepository.swift
//  WeatherApp
//
//  Created by Muhammad muzamal on 20/07/2023.
//

import Foundation


class WeatherApiRepository: WeatherRepository {
    
    func fetchData() async throws -> Weather {
        let endpoint = "https://api.open-meteo.com/v1/forecast?latitude=33.7215&longitude=73.0433&daily=temperature_2m_max&current_weather=true&timezone=auto&start_date=2023-07-17&end_date=2023-07-23"
        guard let url = URL(string: endpoint) else{ throw WeatherErrors.invalidUrl }
         
        let (data, response) =  try await URLSession.shared.data(from: url)
            
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw WeatherErrors.invalidResponse
        }
        return try jsonParser(rawData: data)
    }
    
    private func jsonParser(rawData: Data) throws -> Weather {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let string = String(data: rawData, encoding: .utf8)!
               print("Data as JSON: ")
               print(string)
        do{
            return try decoder.decode(Weather.self, from: rawData)
        }catch{
            throw WeatherErrors.invalidData
        }
    }
    
}

