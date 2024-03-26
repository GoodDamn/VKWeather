//
//  UITableViewCellDay.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final public class UITableViewCellDay
    : UITableViewCell {
    
    public static let id = "dayCell"
    
    private let mLabelDate: UILabel!
    
    public override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        mLabelDate = UILabel()
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        ini()
    }
    
    public required init?(
        coder: NSCoder
    ) {
        mLabelDate = UILabel()
        super.init(
            coder: coder
        )
        ini()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        print(
            UITableViewCellDay.self,
            "layoutSubviews",
            frame
        )
        
        mLabelDate.size(
            width: frame.width,
            height: frame.width * 0.1
        )
        
        mLabelDate
            .defaultFont()
    }
    
    private func ini() {
        mLabelDate.text = "Some date"
        mLabelDate.textColor = .white
        mLabelDate.backgroundColor = .gray
        
        contentView.addSubview(
            mLabelDate
        )
        backgroundColor = .red
    }
    
}
