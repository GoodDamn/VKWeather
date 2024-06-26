//
//  CityForecastViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

final public class CityForecastViewController
    : ForecastViewController {
    
    public final var city = "Moscow"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mWeatherForecastService.start(
            city: city
        )
    }
    
}
