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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mTextField = UITextField(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.width(),
                height: view.height() * 0.1
            )
        )
        
        view.addSubview(
            mTextField
        )
    }
    
}

extension LocalSearchViewController {
    
}
