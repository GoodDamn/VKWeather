//
//  WeatherServiceProtocol.swift
//  VKWeather
//
//  Created by GoodDamn on 22/03/2024.
//

import Foundation

public protocol WeatherServiceDelegate
    : AnyObject {
    
    func onGetWeather(
        model: Weather?
    )
    
    func onGetAirWeather(
        model: WeatherAir?
    )
    
    func onGetCityInfo(
        model: WeatherCity?
    )
    
}
