//
//  WeatherServiceProtocol.swift
//  VKWeather
//
//  Created by GoodDamn on 22/03/2024.
//

import Foundation

public protocol WeatherServiceProtocol
    : AnyObject {
    
    func onGetWeather(
        model: Weather?
    )
    
}
