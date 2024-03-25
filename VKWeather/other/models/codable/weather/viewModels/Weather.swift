//
//  Weather.swift
//  VKWeather
//
//  Created by GoodDamn on 20/03/2024.
//

import Foundation

public struct Weather
    : Codable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}
