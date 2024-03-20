//
//  ViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import UIKit

final class ViewController
    : UIViewController {

    private static let TAG = "ViewController:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UtilsWeather.currentWeather(
            completion: onGetWeatherInfo(info:)
        )
        
    }

    private final func onGetWeatherInfo(
        info: WeatherInfo?
    ) {
        
        // It copies, need to optimize
        // and getting it by reference?
        guard let info = info else {
            print(
                ViewController.TAG,
                "Unable to get weather info. nil"
            )
            return
        }
        
        print(
            ViewController.TAG,
            "Weather Info:",
            info
        )
        
    }

}

