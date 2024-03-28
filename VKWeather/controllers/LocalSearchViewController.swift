//
//  LocalSearchViewController.swift
//  VKWeather
//
//  Created by GoodDamn on 26/03/2024.
//

import UIKit

final public class LocalSearchViewController
    : UIViewController {
    
    private var mTextField: UITextField!
    private var mBtnSearch: UIButton!
    private var mTableResults:
        UITableViewMapResults!
    
    private let mSearchService =
        LocalSearchService()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let marginTop = view.height() * 0.1
        
        mTextField = UITextField(
            frame: CGRect(
                x: view.width()*0.05,
                y: marginTop,
                width: view.width() * 0.7,
                height: view.height() * 0.1
            )
        )
        
        mBtnSearch = UIButton(
            frame: CGRect(
                x: mTextField.xright(),
                y: marginTop,
                width: view.width() -
                    mTextField.xright(),
                height: mTextField.height()
            )
        )
        
        mTableResults = UITableViewMapResults(
            frame: CGRect(
                x: 0,
                y: mBtnSearch.ybottom(),
                width: view.width(),
                height: view.height() - mBtnSearch.ybottom()
            )
        )
        
        mTextField.placeholder = "Search query"
        mTextField.delegate = self
        mTextField.borderStyle = .roundedRect
        mTextField.returnKeyType = .search
        mTextField.keyboardType = .default
        
        mBtnSearch.setTitle(
            "Search",
            for: .normal
        )
        
        mBtnSearch.setTitleColor(
            .accent(),
            for: .normal
        )
        
        mBtnSearch.titleLabel?
            .textAlignment = .center
        
        mBtnSearch.addTarget(
            self,
            action: #selector(
                onClickBtnSearch(_:)
            ),
            for: .touchUpInside
        )
        
        view.addSubview(
            mTextField
        )
        
        view.addSubview(
            mBtnSearch
        )
        
        view.addSubview(
            mTableResults
        )
        
        mTableResults.delegateResult = self
        mSearchService.delegate = self
    }
    
}

extension LocalSearchViewController {
    
    @objc private func onClickBtnSearch(
        _ sender: UIButton
    ) {
        mSearchService.makeRequest(
            query: mTextField.text ?? ""
        )
    }
    
}

extension LocalSearchViewController
    : UITextFieldDelegate {
    
    public func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        
        mSearchService.makeRequest(
            query: textField.text ?? ""
        )
        return true
    }
    
}

extension LocalSearchViewController
    : LocalSearchDelegate {
    
    public func onSearchResults(
        results: inout [String]
    ) {
        mTableResults.result = results
    }
    
}

extension LocalSearchViewController
    : UITableViewMapResultsDelegate {
    
    public func onSelectResult(
        result: String
    ) {
        let cityVc = CityWeatherViewController()
        cityVc.city = result
        navigationController?.pushViewController(
            cityVc,
            animated: true
        )
    }
    
}
