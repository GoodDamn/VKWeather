//
//  ViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import UIKit

public class WeatherViewController
    : UIViewController {
    
    // Strong refs
    private var mLabelTemp: UILabel!
    private var mLabelCity: UILabel!
    private var mLabelTempMaxMin: UILabel!
    private var mLabelWeatherState: UILabel!
    private var mLabelImageHumidity: UILabelImage!
    private var mLabelImagePressure: UILabelImage!
    private var mBtnForecast: UIButton!
    
    internal final var mLastYPosView: CGFloat = 0
    internal final let mWeatherService =
        WeatherService(
            id: 3
        )
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
                    .ybottom() + h * 0.05,
                width: w,
                height: w * 0.04
            )
        )
        
        mLabelImagePressure = UILabelImage(
            frame: CGRect(
                x: marginLeft,
                y: mLabelImageHumidity
                    .ybottom() + h * 0.01,
                width: w,
                height: w * 0.04
            )
        )
        
        mBtnForecast = UIButton(
            frame: CGRect(
                x: 0,
                y: h * 0.9,
                width: w,
                height: h * 0.1
            )
        )
        
        mLastYPosView = mBtnForecast.y()
        
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
        
        mLabelImagePressure
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
        )?.withTintColor(
            .accent()
        )
        
        mLabelImagePressure.text = " --- hPa"
        mLabelImagePressure.textColor = .black
        
        mLabelImagePressure.leftImage = UIImage(
            systemName: "cloud"
        )?.withTintColor(
            .accent()
        )
        
        mBtnForecast.setTitle(
            "See 5 days forecast",
            for: .normal
        )
        
        mBtnForecast.setTitleColor(
            .accent(),
            for: .normal
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
        
        view.addSubview(
            mLabelImagePressure
        )
        
        view.addSubview(
            mBtnForecast
        )
        
        mBtnForecast.addTarget(
            self,
            action: #selector(
                onClickBtnForecast(_:)
            ),
            for: .touchUpInside
        )
        
        mWeatherService.delegate = self
        
        mWeatherService
            .loadFromCache()
        
    }
    
    internal func onForecastViewController(
    ) -> ForecastViewController {
        return ForecastViewController()
    }
    
}

extension WeatherViewController {
    
    @objc private final func onClickBtnForecast(
        _ sender: UIButton
    ) {
        let forecastVc = onForecastViewController()
        present(
            forecastVc,
            animated: true
        )
    }
    
}

extension WeatherViewController
    : WeatherServiceDelegate {
    
    public final func onGetWeather(
        model: Weather?
    ) {
        mLabelWeatherState.text = model?.main
    }
    
    public final func onGetCityInfo(
        model: WeatherCity?
    ) {
        mLabelCity.text = model?.city
    }
    
    public final func onGetAirWeather(
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
        
        mLabelImagePressure.text =
            "\(model.pressure) hPa"
        
        mLabelImageHumidity
            .renderImageText()
        
        mLabelImagePressure
            .renderImageText()
    }
    
}
