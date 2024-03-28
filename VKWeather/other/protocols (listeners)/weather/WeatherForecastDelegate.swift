//
//  WeatherForecastDelegate.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

public protocol WeatherForecastDelegate
    : AnyObject {
    
    func onForecastWeather(
        forecastModel: [WeatherForecastDay]
    )
    
}
