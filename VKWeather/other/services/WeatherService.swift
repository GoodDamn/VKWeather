//
//  WeatherService.swift
//  VKWeather
//
//  Created by GoodDamn on 22/03/2024.
//

import Foundation

final public class WeatherService {
    
    weak var delegate: WeatherServiceProtocol?
    
    public final func start() {
        UtilsWeather.currentWeather(
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
