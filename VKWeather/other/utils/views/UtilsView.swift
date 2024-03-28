//
//  UtilsView.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

final public class UtilsView {
    
    public static func btnSearch(
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat
    ) -> UIButton {
        let btnSearch = UIButton(
            frame: CGRect(
                x: x,
                y: y,
                width: width,
                height: height
            )
        )
        
        btnSearch.setTitle(
            "Search city",
            for: .normal
        )
        
        btnSearch.setTitleColor(
            .accent(),
            for: .normal
        )
        
        return btnSearch
    }
    
}
