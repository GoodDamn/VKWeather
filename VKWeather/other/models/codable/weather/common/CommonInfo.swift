//
//  CommonInfo.swift
//  VKWeather
//
//  Created by GoodDamn on 20/03/2024.
//

import Foundation

public struct CommonInfo
    : Codable {
    
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Int
    let humidity: Int
    
}
