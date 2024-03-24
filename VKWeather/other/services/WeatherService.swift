//
//  WeatherService.swift
//  VKWeather
//
//  Created by GoodDamn on 22/03/2024.
//

import Foundation

final public class WeatherService {
    
    public final weak var delegate: WeatherServiceDelegate?
    
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
            
            guard let delegate = self?.delegate else {
                return;
            }
            
            delegate.onGetWeather(
                model: info?.weather[0]
            )
            
            delegate.onGetAirWeather(
                model: info?.main
            )
            
            delegate.onGetCityInfo(
                model: WeatherCity(
                    city: info?.name,
                    sunriseTime: 0,
                    sunsetTime: 0
                )
            )
            
        }
        
    }
    
}
