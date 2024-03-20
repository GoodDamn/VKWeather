//
//  UtilsWeather.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import Foundation

final public class UtilsWeather {
    
    public static func currentWeather(
        lat: Float=56.11757,
        lon: Float=47.45548,
        completion: @escaping (WeatherInfo?) -> Void
    ) {
        
        // Executes on background thread
        func onCompletionData(
            data: Data
        ) {
            completion(nil)
        }
        
        guard let url = UtilsWeatherUrlMaker
            .mkUrl(
                lat: lat,
                lon: lon
            ) else {
                return
            }
        
        HTTPRequest.make(
            url: url,
            completion: onCompletionData
        )
    }
    
}
