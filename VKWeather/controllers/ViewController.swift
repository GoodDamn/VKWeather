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
    private var mLabelWeatherState: UILabel!
    private var mLabelImageHumidity: UILabelImage!
    
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
        
        mLabelWeatherState = UILabel(
            frame: CGRect(
                x: marginLeft,
                y: mLabelTemp.ybottom(),
                width: w,
                height: w * 0.03
            )
        )
        
        mLabelCity = UILabel(
            frame: CGRect(
                x: marginLeft,
                y: mLabelWeatherState
                    .ybottom() + h * 0.1,
                width: w,
                height: w * 0.05
            )
        )
        
        mLabelTempMaxMin = UILabel(
            frame: CGRect(
                x: marginLeft,
                y: mLabelCity.ybottom() * 1.01,
                width: w,
                height: w * 0.04
            )
        )
        
        mLabelImageHumidity = UILabelImage(
            frame: CGRect(
                x: marginLeft,
                y: mLabelTempMaxMin
                    .ybottom() * 1.01,
                width: w,
                height: w * 0.04
            )
        )
        
        mLabelTemp
            .defaultFont()
        
        mLabelWeatherState
            .defaultFont()
        
        mLabelCity
            .defaultFont()
        
        mLabelTempMaxMin
            .defaultFont()
        
        mLabelImageHumidity
            .defaultFont()
        
        mLabelTemp.text = "-"
        mLabelTemp.textColor = .black
        
        mLabelWeatherState.text = "----"
        mLabelWeatherState.textColor = .black
        
        mLabelCity.text = "Your city"
        mLabelCity.textColor = .black
        
        mLabelTempMaxMin.text = "--/--"
        mLabelTempMaxMin.textColor = .black
        
        mLabelImageHumidity.text = " -- %"
        mLabelImageHumidity.textColor = .black
        mLabelImageHumidity.leftImage = UIImage(
            systemName: "humidity"
        )
        
        view.addSubview(
            mLabelTemp
        )
        
        view.addSubview(
            mLabelWeatherState
        )
        
        view.addSubview(
            mLabelCity
        )
        
        view.addSubview(
            mLabelTempMaxMin
        )
        
        view.addSubview(
            mLabelImageHumidity
        )
        
        mLabelImageHumidity.render()
        
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
        mLabelWeatherState.text = model?.main
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
        mLabelImageHumidity.text =
            "\(model.humidity) %"
        
        mLabelImageHumidity.render()
        
    }
    
}
