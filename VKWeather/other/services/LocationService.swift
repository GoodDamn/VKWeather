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
    
    public weak var delegate:
        LocationServiceDelegate?
    
    private let mLocationManager: CLLocationManager
    
    override init() {
        mLocationManager = CLLocationManager()
        super.init()
        mLocationManager.delegate = self
    }
    
    
    public final func start() {
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
        
        let status = manager.authStatus()
        
        if !(status == .authorizedAlways ||
            status == .authorizedWhenInUse) {
            return
        }
        
        delegate?.onGetLocation(
            lat: manager.latitude(),
            long: manager.longtitude()
        )
    }
    
}
