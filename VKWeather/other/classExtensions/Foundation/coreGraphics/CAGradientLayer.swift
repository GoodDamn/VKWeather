//
//  CAGradientLayer.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

extension CAGradientLayer {
    
    static func afternoon(
        frame: CGRect
    ) -> CAGradientLayer {
        let gradient = Self()
        
        gradient.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.white.cgColor
        ]
        
        gradient.startPoint = CGPoint(
            x: 0.0,
            y: 0.0
        )
        
        gradient.endPoint = CGPoint(
            x: 1.5,
            y: 2.0
        )
        
        gradient.type = .axial
        gradient.frame = frame
        
        return gradient
    }
    
}
