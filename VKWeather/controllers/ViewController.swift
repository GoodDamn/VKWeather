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
    
    // Strong refs
    private var mLabelTemparature: UILabel!
    private var mLabelPressure: UILabel!
    private var mLabelHumidity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenBounds = view
            .bounds
        
        let w = screenBounds.width
        let h = screenBounds.height
        
        mLabelPressure = UILabel(
            frame: CGRect(
                x: w * 0.1,
                y: h * 0.1,
                width: w,
                height: 0
            )
        )
        
        mLabelPressure.font = UIFont.systemFont(
            ofSize: 18.0
        )
        mLabelPressure.text = "Loading info"
        mLabelPressure.textColor = .black
        mLabelPressure.sizeToFit()
        
        view.addSubview(
            mLabelPressure
        )
        
        UtilsWeather.currentWeather(
            completion: onGetWeatherInfo(info:)
        )
    }
    
    // Executes on background thread
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
        
        let weather = info.weather[0]
        
        DispatchQueue.main.async { [weak self] in
            self?.updateView(
                with: weather
            );
        }
        
        print(
            ViewController.TAG,
            "Weather Info:",
            info
        )
        
    }
    
    private final func updateView(
        with weather: Weather
    ) {
        mLabelPressure.text = weather
            .main
        
    }

}

