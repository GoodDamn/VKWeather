//
//  CityForecastViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

final public class LocationForecastViewController
    : ForecastViewController {
    
    private let mLocationService =
        LocationService()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mLocationService
            .delegate = self
        
        mLocationService
            .start()
    }
    
}

extension LocationForecastViewController
    : LocationServiceDelegate {
    
    public final func onGetLocation(
        lat: Float,
        long: Float
    ) {
        mWeatherForecastService.start(
            lat: lat,
            lon: long
        )
    }
    
}
