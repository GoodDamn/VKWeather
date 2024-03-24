//
//  WeatherService.swift
//  VKWeather
//
//  Created by GoodDamn on 22/03/2024.
//

import Foundation

final public class WeatherService {
    
    public final weak var delegate: WeatherServiceProtocol?
    
    public final func start(
        lat: Float,
        long: Float
    ) {
        UtilsWeather.currentWeather(
            lat: lat,
            lon: long,
            completion: onGetWeatherInfo(info:)
        )
    }
    
    // Executes on background thread
    private final func onGetWeatherInfo(
        info: WeatherInfo?
    ) {
        DispatchQueue.ui { [weak self] in
            self?.delegate?.onGetWeather(
                model: info?.weather[0]
            )
        }
        
    }
    
}
