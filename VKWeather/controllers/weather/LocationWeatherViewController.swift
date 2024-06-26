//
//  LocationWeatherViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

public class LocationWeatherViewController
    : WeatherViewController {
    
    private let mLocationService =
        LocationService()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mLocationService.delegate = self
        mLocationService.start()
        
    }
    
    override func onForecastViewController(
    ) -> ForecastViewController {
        return LocationForecastViewController()
    }
    
}

extension LocationWeatherViewController
    : LocationServiceDelegate {
    
    public func onGetLocation(
        lat: Float,
        long: Float
    ) {
        print(
            WeatherViewController.self,
            "onGetLocation:",
            lat,
            long
        )
        
        mWeatherService.start(
            lat: lat,
            long: long
        )
        
    }
    
}
