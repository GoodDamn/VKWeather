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
    
}
