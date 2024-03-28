//
//  UITableViewMapResults.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

final public class UITableViewMapResults
    : UITableView {
    
    private static let mCellId = "mapCell"
    
    public final var delegateResult:
        UITableViewMapResultsDelegate?
    
    public final var result: [String]? {
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
        
        delegate = self
        dataSource = self
    }
    
}

extension UITableViewMapResults
    : UITableViewDelegate {
    
    public func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let index = indexPath.row
        
        guard let res = result?[index] else {
            return
        }
        
        delegateResult?.onSelectResult(
            result: res
        )
    }
    
}

extension UITableViewMapResults
    : UITableViewDataSource {
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return result?.count ?? 0
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
            result?[index]
        
        return cell
    }
    
}
