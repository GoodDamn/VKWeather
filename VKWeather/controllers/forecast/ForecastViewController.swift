//
//  ForecastViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 26/03/2024.
//

import UIKit

public class ForecastViewController
    : UIViewController {
    
    internal final let mWeatherForecastService =
        WeatherForecastService(
            id: 2
        )
    
    private var mTableForecast: UITableViewForecast!
    
    public final override func loadView() {
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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mWeatherForecastService
            .delegate = self
        
        mWeatherForecastService
            .loadFromCache()
    }
    
}

extension ForecastViewController
    : WeatherForecastDelegate {
    
    public final func onForecastWeather(
        forecastModel: [WeatherForecastDay]
    ) {
        mTableForecast.forecastDays =
            forecastModel
    }
    
}
