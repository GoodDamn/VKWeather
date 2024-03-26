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
    private let mLabelTemp: UILabel!
    
    public final var hour: Int? {
        didSet {
            if hour == nil {
                return
            }
            mLabelHour.text = "\(hour!):00"
        }
    }
    
    public final var temperature: Int? {
        didSet {
            if temperature == nil {
                return
            }
            mLabelTemp.text = "\(temperature) °C"
        }
    }
    
    public override init(
        frame: CGRect
    ) {
        mLabelHour = UILabel()
        mLabelTemp = UILabel()
        super.init(
            frame: frame
        )
        ini()
    }
        
    public required init?(
        coder: NSCoder
    ) {
        mLabelHour = UILabel()
        mLabelTemp = UILabel()
        super.init(
            coder: coder
        )
        ini()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let fontSize = width() * 0.3
        
        mLabelHour.frame(
            x: 0,
            y: 0,
            width: width(),
            height: fontSize
        )
        
        mLabelHour.fontSizeEqualsHeight()
    
        mLabelTemp.frame(
            x: 0,
            y: height() - fontSize - height() * 0.1,
            width: width(),
            height: fontSize
        )
        
        mLabelTemp.fontSizeEqualsHeight()
    
        
    }
    
    private final func ini() {
        mLabelHour.textColor = .black
        mLabelHour.textAlignment = .center
        
        mLabelTemp.textColor = .black
        mLabelTemp.textAlignment = .center
        
        contentView.addSubview(
            mLabelHour
        )
        
        contentView.addSubview(
            mLabelTemp
        )
    }
}
