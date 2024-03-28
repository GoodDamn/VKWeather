//
//  UITableViewMapResults.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit
import MapKit.MKMapItem

final public class UITableViewMapResults
    : UITableView {
    
    private static let mCellId = "mapCell"
    
    public final var mapItems: [MKMapItem]? {
        didSet {
            reloadData()
        }
    }
    
    public init(
        frame: CGRect
    ) {
        super.init(
            frame: frame,
            style: .plain
        )
        ini()
    }
    
    public required init?(
        coder: NSCoder
    ) {
        super.init(
            coder: coder
        )
        ini()
    }
    
    private final func ini() {
        
        register(
            UITableViewCell.self,
            forCellReuseIdentifier: UITableViewMapResults
                .mCellId
        )
        
        dataSource = self
    }
    
}

extension UITableViewMapResults
    : UITableViewDataSource {
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return mapItems?.count ?? 0
    }
    
    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: UITableViewMapResults
                .mCellId,
            for: indexPath
        )
        
        let index = indexPath
            .row
        
        cell.textLabel?.text =
            mapItems?[index].name
        
        return cell
    }
    
}
