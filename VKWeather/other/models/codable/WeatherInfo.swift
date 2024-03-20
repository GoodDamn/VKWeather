//
//  Weather.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import Foundation

public struct WeatherInfo
    : Codable {
    let temperature: Float
    let feelsLike: Float
    let pressure: Int
    let humidity: UInt8
}
