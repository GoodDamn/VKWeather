//
//  LocalSearchDelegate.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import Foundation

public protocol LocalSearchDelegate
    : AnyObject {
    
    func onSearchResults(
        results: inout [String]
    )
    
}
