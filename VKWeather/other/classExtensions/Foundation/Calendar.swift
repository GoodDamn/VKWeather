//
//  Calendar.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

extension Calendar {
    
    
    static func hour(
        timeSince1970: Int?
    ) -> Int? {
        let date = Date(
            timeIntervalSince1970: TimeInterval(
                timeSince1970 ?? 0
            )
        )
        
        let comps = current.dateComponents(
            [.hour],
            from: date
        )
        
        return comps.day
    }
    
}
