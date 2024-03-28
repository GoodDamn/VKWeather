//
//  LocationWithSearchViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 27/03/2024.
//

import UIKit

final public class LocationWithSearchViewController
    : LocationWeatherViewController {
    
    private var mBtnSearch: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.width()
        let h = view.height()
        
        mBtnSearch = UtilsView.btnSearch(
            x: 0,
            y: mLastYPosView - h * 0.1,
            width: w,
            height: h * 0.1
        )
        
        mBtnSearch.addTarget(
            self,
            action: #selector(
                onClickBtnSearch(_:)
            ),
            for: .touchUpInside
        )
        
        view.addSubview(
            mBtnSearch
        )
    }
    
}

extension LocationWithSearchViewController {
    
    @objc private final func onClickBtnSearch(
        _ sender: UIButton
    ) {
        let localSearch =
            LocalSearchViewController()
        
        navigationController?
            .pushViewController(
                localSearch,
                animated: true
            )
    }
}
