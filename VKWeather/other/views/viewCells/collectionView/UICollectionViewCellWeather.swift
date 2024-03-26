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
    
    public final var hour: Int? {
        didSet {
            if hour == nil {
                return
            }
            mLabelHour.text = "\(hour!):00"
        }
    }
    
    public override init(
        frame: CGRect
    ) {
        mLabelHour = UILabel()
        super.init(
            frame: frame
        )
        ini()
    }
        
    public required init?(
        coder: NSCoder
    ) {
        mLabelHour = UILabel()
        super.init(
            coder: coder
        )
        ini()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        mLabelHour.frame(
            x: 0,
            y: 0,
            width: width(),
            height: width() * 0.3
        )
        
        mLabelHour.fontSizeEqualsHeight()
    }
    
    private final func ini() {
        mLabelHour.textColor = .black
        mLabelHour.textAlignment = .center
        
        contentView.addSubview(
            mLabelHour
        )
    }
}
