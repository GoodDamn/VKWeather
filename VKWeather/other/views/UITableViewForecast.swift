//
//  UITableViewForecast.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final public class UITableViewForecast
    : UITableView {
    
    // Copy-on-write
    public final var forecastDays: [WeatherForecastDay]? {
        didSet {
            reloadData()
        }
    }
    
    public init(
        frame: CGRect
    ) {
        super.init(
            frame: frame,
            style: .plain)
        
        dataSource = self
        
        register(
            UITableViewCellDay.self,
            forCellReuseIdentifier: UITableViewCellDay
                .id
        )
    }
    
    public required init?(
        coder: NSCoder
    ) {
        super.init(
            coder: coder
        )
    }
    
}

extension UITableViewForecast
    : UITableViewDataSource {
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return forecastDays?.count ?? 0
    }
    
    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(
                withIdentifier: UITableViewCellDay
                    .id
            ) as? UITableViewCellDay else {
                let c = UITableViewCell()
                c.backgroundColor = .red
                return c
            }
        
        return cell
    }
    
}
