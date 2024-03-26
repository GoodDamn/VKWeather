//
//  UICollectionCellWeather.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final public class UICollectionViewCellWeather
    : UICollectionViewCell {
    
    public static let id = "weatherCell"
    
    private let mLabelHour: UILabel!
    
    public override init(
        frame: CGRect
    ) {
        mLabelHour = UILabel()
        super.init(
            frame: frame
        )
    }
        
    public required init?(
        coder: NSCoder
    ) {
        mLabelHour = UILabel()
        super.init(
            coder: coder
        )
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        mLabelHour.frame(
            x: 0,
            y: 0,
            width: width(),
            height: width() * 0.1
        )
        
        mLabelHour.fontSizeEqualsHeight()
    }
    
    private final func ini() {
        mLabelHour.text = "..."
        mLabelHour.textColor = .black
        
        contentView.addSubview(
            mLabelHour
        )
    }
}
