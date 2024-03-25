//
//  Float.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

extension Float {
    
    mutating func celius() -> Int {
        Int(self - 273.15)
    }
    
}
