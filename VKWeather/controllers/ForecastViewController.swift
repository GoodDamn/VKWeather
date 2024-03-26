//
//  ForecastViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 26/03/2024.
//

import UIKit

final class ForecastViewController
    : UIViewController {
    
    private var mTableForecast: UITableViewForecast!
    
    private let mWeatherForecastService =
        WeatherForecastService()
    
    private let mLocationService =
        LocationService()
    
    override func loadView() {
        mTableForecast = UITableViewForecast(
            frame: .zero
        )
        
        mTableForecast.backgroundColor =
            .clear
        
        mTableForecast
            .showsVerticalScrollIndicator = false
        
        mTableForecast
            .showsHorizontalScrollIndicator = false
        view = mTableForecast
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mLocationService
            .delegate = self
        
        mWeatherForecastService
            .delegate = self
        
        mLocationService.start()
    }
    
}

extension ForecastViewController
    : LocationServiceDelegate {
    
    func onGetLocation(
        lat: Float,
        long: Float
    ) {
        mWeatherForecastService.start(
            lat: lat,
            lon: long
        )
    }
    
}

extension ForecastViewController
    : WeatherForecastDelegate {
    
    func onForecastWeather(
        forecastModel: [WeatherForecastDay]
    ) {
        mTableForecast.forecastDays =
            forecastModel
    }
    
}
