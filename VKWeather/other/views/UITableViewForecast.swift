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
        
        delegate = self
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
    : UITableViewDelegate {
    
    public func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 207.0
    }
    
}

extension UITableViewForecast
    : UITableViewDataSource {
    
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        print(
            UITableViewForecast.self,
            "numberOfRowsInSection",
            forecastDays?.count)
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
                return UITableViewCell()
            }
        
        let index = indexPath.row
        
        guard let model = forecastDays?[index] else {
            return UITableViewCell()
        }
        
        cell.date = model.date
        
        return cell
    }
    
}
