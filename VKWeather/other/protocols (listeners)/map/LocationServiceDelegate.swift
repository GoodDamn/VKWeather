//
//  LocationServiceProtocol.swift
//  VKWeather
//
//  Created by GoodDamn on 24/03/2024.
//

import Foundation

public protocol LocationServiceDelegate
    : AnyObject {
    
    func onGetLocation(
        lat: Float,
        long: Float
    )
    
}
