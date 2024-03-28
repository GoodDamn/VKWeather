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
    }
    
    
    public final func start() {        mLocationManager.delegate = self
        
        print(
            LocationService.self,
            "start:",
            delegate
        )
        
        if isValid() {
            delegate?.onGetLocation(
                lat: mLocationManager
                    .latitude(),
                long: mLocationManager
                    .longtitude()
            )
            return
        }
        
        mLocationManager
            .requestWhenInUseAuthorization()
    }
    
}

extension LocationService {
    
    public final func isValid() -> Bool {
        let status = mLocationManager
            .authStatus()
        
        return status == .authorizedAlways
            || status == .authorizedWhenInUse
    }
    
}

extension LocationService
    : CLLocationManagerDelegate {
    
    public func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        if !isValid() {
            return
        }
        
        delegate?.onGetLocation(
            lat: manager.latitude(),
            long: manager.longtitude()
        )
    }
    
}
