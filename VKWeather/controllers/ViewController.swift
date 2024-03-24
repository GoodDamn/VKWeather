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
    
    private let mWeatherService =
        WeatherService()
    
    private let mLocationService =
        LocationService()
    
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
        
        mWeatherService.delegate = self
        mLocationService.delegate = self
        
        mLocationService.start()
    }
    
}

extension ViewController
    : LocationServiceDelegate {
    
    func onGetLocation(
        lat: Float,
        long: Float
    ) {
        mWeatherService.start(
            lat: lat,
            long: long
        )
    }
    
}

extension ViewController
    : WeatherServiceDelegate {
    
    func onGetWeather(
        model: Weather?
    ) {
        mLabelPressure.text = model?.main
    }
    
}
