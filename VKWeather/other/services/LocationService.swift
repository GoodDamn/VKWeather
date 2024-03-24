//
//  LocationService.swift
//  VKWeather
//
//  Created by GoodDamn on 24/03/2024.
//

import Foundation
import MapKit

final public class LocationService
    : NSObject {
    
    public var latitude: Float {
        get {
            return mLocationManager
                .latitude()
        }
    }
    
    public var longtitude: Float {
        get {
            return mLocationManager
                .longtitude()
        }
    }
    
    private let mLocationManager: CLLocationManager
    
    override init() {
        
        mLocationManager = CLLocationManager()
        super.init()
        mLocationManager.delegate = self
        mLocationManager
            .requestWhenInUseAuthorization()
    }
    
}

extension LocationService
    : CLLocationManagerDelegate {
    
    public func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        print("LocationManager: didChangeAuth");
    }
    
}
