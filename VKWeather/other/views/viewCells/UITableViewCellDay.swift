//
//  UITableViewCellDay.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final public class UITableViewCellDay
    : UITableViewCell {
    
    private static let TAG = "UITableViewCellDay"
    
    public static let id = "dayCell"
    
    private lazy var mLabelDate: UILabel = {
        
        let label = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: frame.width,
                height: frame.height * 0.2
            )
        )
        
        mLabelDate.text = "Some date"
        mLabelDate.textColor = .white
        mLabelDate.backgroundColor = .gray
        
        contentView.addSubview(
            mLabelDate
        )
        
        return label
    }()
    
    public override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
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
