//
//  File.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

public struct WeatherInfoCity
    : Codable {
    let weather: [Weather]
    let main: WeatherAir
    let name: String
}
