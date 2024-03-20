//
//  DispatchQueue.swift
//  VKWeather
//
//  Created by GoodDamn on 20/03/2024.
//

import Foundation

extension DispatchQueue {
    
    static func ui(
        execute: @escaping () -> Void
    ) {
        
        DispatchQueue
            .main
            .async(
                execute: execute
            )
        
    }
    
}
