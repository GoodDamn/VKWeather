//
//  WeatherForecastService.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

final public class WeatherForecastService
    : BaseModelService<WeatherForecast> {
    
    private static let mUrlApiForecast = "https://api.openweathermap.org/data/2.5/forecast"
    
    public final weak var delegate: WeatherForecastDelegate?
    
    public final func start(
        lat: Float,
        lon: Float
    ) {
        let url = UtilsWeatherUrlMaker
            .mkUrl(
                url: WeatherForecastService
                    .mUrlApiForecast,
                lat: lat,
                lon: lon
            )
        
        startService(
            url: url
        )
    }
    
    override final func onGetModelBackground(
        model: WeatherForecast?
    ) {
        print(
            "WeatherForecastService: onGetModel:",
            model
        )
    }
}
