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
    
    private let mSearchService =
        LocalSearchService()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mTextField = UITextField(
            frame: CGRect(
                x: 0,
                y: view.height() * 0.1,
                width: view.width(),
                height: view.height() * 0.1
            )
        )
        
        mTextField.placeholder = "Search query"
        mTextField.delegate = self
        mTextField.borderStyle = .roundedRect
        mTextField.returnKeyType = .search
        mTextField.keyboardType = .default
        
        view.addSubview(
            mTextField
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
