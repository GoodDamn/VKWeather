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
    private var mLabelTemp: UILabel!
    private var mLabelCity: UILabel!
    
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
        
        
        mLabelTemp = UILabel(
            frame: CGRect(
                x: w * 0.1,
                y: h * 0.1,
                width: w,
                height: h * 0.07)
        )
        
        mLabelCity = UILabel(
            frame: CGRect(
                x: w*0.1,
                y: h*0.17,
                width: w,
                height: h * 0.03
            )
        )
        
        mLabelTemp.font = UIFont.systemFont(
            ofSize: mLabelTemp.height()
        )
        
        mLabelCity.font = UIFont.systemFont(
            ofSize: mLabelCity.height()
        )
        
        mLabelTemp.text = "-"
        mLabelTemp.textColor = .black
        
        mLabelCity.text = "Not your city"
        mLabelCity.textColor = .black
        
        view.addSubview(
            mLabelTemp
        )
        
        view.addSubview(
            mLabelCity
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
        print(
            ViewController.TAG,
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

extension ViewController
    : WeatherServiceDelegate {
    
    func onGetWeather(
        model: Weather?
    ) {
        guard let model = model else {
            return
        }
    }
    
    func onGetCityInfo(
        model: WeatherCity?
    ) {
        mLabelCity.text = model?.city
    }
    
    func onGetAirWeather(
        model: WeatherAir?
    ) {
        guard let model = model else {
            return;
        }
        
        let celius = model.temp - 273.15
        
        mLabelTemp.text = "\(celius) C"
        
    }
    
}
