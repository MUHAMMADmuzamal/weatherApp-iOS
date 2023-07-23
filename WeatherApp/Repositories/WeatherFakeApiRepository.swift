//
//  WeatherFakeApiRepository.swift
//  WeatherApp
//
//  Created by Muhammad muzamal on 20/07/2023.
//

import Foundation

class WeatherFakeApiRepository: WeatherRepository{
    func fetchData() throws -> Weather{
        let json = """
        {
           "latitude":33.625,
           "longitude":73.125,
           "generationtime_ms":1.053929328918457,
           "utc_offset_seconds":18000,
           "timezone":"Asia/Karachi",
           "timezone_abbreviation":"PKT",
           "elevation":583.0,
           "current_weather":{
              "temperature":32.8,
              "windspeed":4.8,
              "winddirection":228.0,
              "weathercode":1,
              "is_day":1,
              "time":"2023-07-20T17:00"
           },
           "daily_units":{
              "time":"iso8601",
              "temperature_2m_max":"°C"
           },
           "daily":{
              "time":[
                 "2023-07-17",
                 "2023-07-18",
                 "2023-07-19",
                 "2023-07-20",
                 "2023-07-21",
                 "2023-07-22",
                 "2023-07-23"
              ],
              "temperature_2m_max":[
                 35.2,
                 34.3,
                 28.2,
                 33.0,
                 33.3,
                 28.2,
                 28.2
              ]
           }
        }
        """.data(using: .utf8)!
        return try jsonParser(rawData: json)
    }
    
    func jsonParser(rawData: Data) throws -> Weather {
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

