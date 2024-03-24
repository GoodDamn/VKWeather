//
//  CLLocationManager.swift
//  VKWeather
//
//  Created by GoodDamn on 24/03/2024.
//

import MapKit

extension CLLocationManager {
    
    func latitude() -> Float {
        Float(
            location?
                .coordinate
                .latitude ?? 0
        )
    }
    
    func longtitude() -> Float {
        Float(
            location?
                .coordinate
                .latitude ?? 0
        )
    }
    
}
