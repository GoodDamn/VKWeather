//
//  Weather.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import Foundation

public struct WeatherInfo
    : Codable {
    let weather: [Weather]
    let main: WeatherAir
}
