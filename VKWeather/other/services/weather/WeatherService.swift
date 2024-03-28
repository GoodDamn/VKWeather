//
//  WeatherService.swift
//  VKWeather
//
//  Created by GoodDamn on 22/03/2024.
//

import Foundation

final public class WeatherService
    : BaseModelService<WeatherInfoCity> {
    
    private static let mUrlApiWeather = "https://api.openweathermap.org/data/2.5/weather"
    
    public final weak var delegate: WeatherServiceDelegate?
    
    
    init(
        id: Int
    ) {
        super.init(
            cacheFileName: "\(id)cur.json"
        )
    }
    
    public final func start(
        lat: Float,
        long: Float
    ) {
        let url = UtilsWeatherUrlMaker
            .mkUrl(
                url: WeatherService
                    .mUrlApiWeather,
                lat: lat,
                lon: long
            )
        
        startService(
            url: url
        )
    }
    
    public final func start(
        city: String
    ) {
        let url = UtilsWeatherUrlMaker
            .mkUrl(
                url: WeatherService
                    .mUrlApiWeather,
                city: city
            )
        
        startService(
            url: url
        )
    }
    
    // Executes on background thread
    final override func onGetModelBackground(
        model: WeatherInfoCity?
    ) {
        DispatchQueue.ui { [weak self] in
            
            guard let delegate = self?.delegate else {
                return;
            }
            
            delegate.onGetWeather(
                model: model?.weather[0]
            )
            
            delegate.onGetAirWeather(
                model: model?.main
            )
            
            delegate.onGetWindInfo(
                model: model?.wind
            )
            
            delegate.onGetCityInfo(
                model: WeatherCity(
                    city: model?.name,
                    sunriseTime: 0,
                    sunsetTime: 0
                )
            )
            
        }
    }
    
}
