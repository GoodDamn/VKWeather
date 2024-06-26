//
//  UIView.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

extension UIView {
    func height() -> CGFloat {
        frame.height
    }
    
    func width() -> CGFloat {
        frame.width
    }
    
    func ybottom() -> CGFloat {
        frame.origin.y + frame.height
    }
    
    func xright() -> CGFloat {
        frame.origin.x + frame.width
    }
    
    func y() -> CGFloat {
        frame.origin.y
    }
    
    func size(
        width: CGFloat,
        height: CGFloat
    ) {
        frame.size
            .width = width
        
        frame.size
            .height = height
        
    }
    
    func frame(
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat
    ) {
        frame.origin
            .x = x
        
        frame.origin
            .y = y
        
        frame.size
            .width = width
        
        frame.size
            .height = height
    }
    
}
