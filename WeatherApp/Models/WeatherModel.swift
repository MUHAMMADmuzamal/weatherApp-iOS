//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Muhammad muzamal on 20/07/2023.
//

import Foundation

// MARK: - Weather
struct Weather: Codable{
    let latitude, longitude, generationtimeMs: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Double
    let currentWeather: CurrentWeather
    let dailyUnits: DailyUnits
    let daily: Daily
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let temperature, windspeed, winddirection: Double
    let weathercode, isDay: Int
    let time: String
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]
    let temperature2MMax: [Double]
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, temperature2MMax: String
}

/**
 {
     "latitude":33.625,
     "longitude":73.125,
     "generationtime_ms":0.9371042251586,
     "utc_offset_seconds":18000,
     "timezone":"Asia/Karachi",
     "timezone_abbreviation":"PKT",
     "elevation":583.0,
     "current_weather":{
         "temperature":32.9,
         "windspeed":4.3,
         "winddirection":204.0,
         "weathercode":3,
         "is_day":1,
         "time":"2023-07-20T15:00"
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
              "2023-07-23"],
     "temperature_2m_max":[
              35.2,
              34.3,
              28.2,
              33.0,
              33.3,
              28.2,
              28.2]
     }
     
 } */


/*
// MARK: - Weather
struct Weather: Codable {
    let latitude, longitude, generationtimeMs: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentWeather: CurrentWeather
    let dailyUnits: DailyUnits
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMs = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentWeather = "current_weather"
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let temperature, windspeed: Double
    let winddirection, weathercode, isDay: Int
    let time: String

    enum CodingKeys: String, CodingKey {
        case temperature, windspeed, winddirection, weathercode
        case isDay = "is_day"
        case time
    }
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]
    let temperature2MMax: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
    }
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, temperature2MMax: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
    }
}
*/
