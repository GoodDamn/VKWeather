//
//  WeatherCity.swift
//  VKWeather
//
//  Created by GoodDamn on 24/03/2024.
//

import Foundation

public struct WeatherCity
    : Codable {
    let city: String?
    let sunriseTime: Int
    let sunsetTime: Int
}
