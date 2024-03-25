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
    private var mLabelTempMaxMin: UILabel!
    
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
        
        let marginLeft = w * 0.1
        
        mLabelTemp = UILabel(
            frame: CGRect(
                x: marginLeft,
                y: h * 0.1,
                width: w,
                height: w * 0.12)
        )
        
        mLabelCity = UILabel(
            frame: CGRect(
                x: marginLeft,
                y: h*0.17,
                width: w,
                height: w * 0.05
            )
        )
        
        mLabelTempMaxMin = UILabel(
            frame: CGRect(
                x: marginLeft,
                y: mLabelCity.ybottom() * 1.2,
                width: w,
                height: w * 0.04
            )
        )
        
        mLabelTemp.font = UIFont.systemFont(
            ofSize: mLabelTemp
                .height()
        )
        
        mLabelCity.font = UIFont.systemFont(
            ofSize: mLabelCity
                .height()
        )
        
        mLabelTempMaxMin.font = UIFont.systemFont(
            ofSize: mLabelTempMaxMin
                .height()
        )
        
        mLabelTemp.text = "-"
        mLabelTemp.textColor = .black
        
        mLabelCity.text = "Not your city"
        mLabelCity.textColor = .black
        
        mLabelTempMaxMin.text = "--/--"
        mLabelTempMaxMin.textColor = .black
        
        view.addSubview(
            mLabelTemp
        )
        
        view.addSubview(
            mLabelCity
        )
        
        view.addSubview(
            mLabelTempMaxMin
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
        
        mLabelTemp.text =
            "\(model.temp.celius()) °C"
        
        mLabelTempMaxMin.text = """
            \(model.temp_max.celius()) °C / \(model.temp_min.celius()) °C
            """
    }
    
}
