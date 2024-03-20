//
//  UtilsWeather.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import Foundation

final public class UtilsWeather {
    
    private static let TAG = "UtilsWeather"
    
    public static func currentWeather(
        lat: Float=56.11757,
        lon: Float=47.45548,
        completion: @escaping
            (WeatherInfo?) -> Void
    ) {
        
        // Executes on background thread
        func onCompletionData(
            data: Data
        ) {
            
            do {
                let weatherInfo = try JSONDecoder()
                    .decode(
                        WeatherInfo.self,
                        from: data
                    )
                completion(
                    weatherInfo
                )
            } catch {
                print(
                    UtilsWeather.TAG,
                    "Unable to decode WeatherInfo JSON",
                    error
                )
                completion(nil)
            }
            
        }
        
        guard let url = UtilsWeatherUrlMaker
            .mkUrl(
                lat: lat,
                lon: lon
            ) else {
                print(
                    UtilsWeather.TAG,
                    "URL_MAKER_ERROR"
                )
                return
            }
        
        HTTPRequest.make(
            url: url,
            completion: onCompletionData(data:)
        )
    }
    
}
