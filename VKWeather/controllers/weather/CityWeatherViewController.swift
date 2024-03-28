//
//  CityWeatherViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

final public class CityWeatherViewController
    : WeatherViewController {
    
    public final var city = "Moscow"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mWeatherService.start(
            city: city
        )
    }
    
}


