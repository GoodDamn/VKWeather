//
//  UITableViewMapResultsDelegate.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import Foundation

public protocol UITableViewMapResultsDelegate
    : AnyObject {
    
    func onSelectResult(
        result: String
    )
}
