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
    
    init(
        id: Int
    ) {
        super.init(
            cacheFileName: "\(id)for.json"
        )
    }
    
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
    
    public final func start(
        city: String
    ) {
        let url = UtilsWeatherUrlMaker
            .mkUrl(
                url: WeatherForecastService
                    .mUrlApiForecast,
                city: city
            )
        
        startService(
            url: url
        )
    }
    
    override final func onGetModelBackground(
        model: WeatherForecast?
    ) {
        
        guard let model = model else {
            return
        }
        
        var days: [WeatherForecastDay] = []
        
        var infoPerDay: [WeatherInfo] = []
        
        // timestamps in day (per 3 hours)
        let interval = 8
        var i = 0
        
        infoPerDay.reserveCapacity(
            interval
        )
        
        for info in model.list {
            i += 1
            if i == interval {
                let date = Date(
                    timeIntervalSince1970:
                        TimeInterval(
                            infoPerDay[0]
                                .dt
                        )
                )
                
                days.append(
                    WeatherForecastDay(
                        date: date,
                        info: infoPerDay
                    )
                )
                i = 0
                infoPerDay.removeAll(
                    keepingCapacity: true
                )
                continue
            }
            
            infoPerDay.append(
                info
            )
        }
        
        DispatchQueue.ui { [weak self] in
            self?.delegate?.onForecastWeather(
                forecastModel: days
            )
        }
    }
}
