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
    private static let mDateFormat:
        DateFormatter = {
            let format = DateFormatter()
            format.dateFormat = "dd/MM"
            print(UITableViewCellDay.self, "DATE_FORMAT")
            return format
        }()
    
    private let mLabelDate: UILabel!
    private let mCollectionForecast:
        UICollectionViewForecast!
    
    public final var date: Date? {
        didSet {
            guard let date = date else {
                return
            }
            
            mLabelDate.text = UITableViewCellDay
                .mDateFormat
                .string(
                    from: date
                )
        }
    }
    
    public final var forecast: [WeatherInfo]? {
        set(val) {
            mCollectionForecast
                .forecast = val
        }
        
        get {
            return mCollectionForecast
                .forecast
        }
    }
    
    public override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        mLabelDate = UILabel()
        mCollectionForecast =
            UICollectionViewForecast(
                frame: .zero
            )
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
        mCollectionForecast = UICollectionViewForecast(
                frame: .zero
            )
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
            width: width(),
            height: width() * 0.07
        )
        
        mLabelDate.fontSizeEqualsHeight()
        
        mCollectionForecast.frame(
            x: 0,
            y: mLabelDate.ybottom(),
            width: width(),
            height: height() - mLabelDate
                .ybottom()
        )
        
    }
    
    private func ini() {
        mLabelDate.text = "Some date"
        mLabelDate.textColor = .black
        mLabelDate.backgroundColor =
            .clear
        
        mLabelDate.textAlignment = .center
        
        mCollectionForecast.backgroundColor =
            .clear
        
        mCollectionForecast
            .showsHorizontalScrollIndicator = false
        
        mCollectionForecast
            .showsVerticalScrollIndicator = false
        
        contentView.addSubview(
            mLabelDate
        )
        
        contentView.addSubview(
            mCollectionForecast
        )
    }
    
}
