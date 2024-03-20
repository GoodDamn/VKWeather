//
//  UtilsWeatherUrlMaker.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import Foundation

final public class UtilsWeatherUrlMaker {
    
    // Not save here?
    private static let mApiKey = "f2ea41f1906912df818f069df182c665"
    
    private static let mUrlApi = "https://api.openweathermap.org/data/2.5/weather"
    
    
    public static func mkUrl(
        lat: Float,
        lon: Float
    ) -> URL? {
        return URL(
            string: "\(mUrlApi)?lat=\(lat)&lon=\(lon)&appid=\(mApiKey)"
        );
    }
    
}
