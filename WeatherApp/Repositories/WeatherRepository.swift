//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Muhammad muzamal on 20/07/2023.
//

import Foundation
protocol WeatherRepository {
    func fetchData()async throws -> Weather
}
