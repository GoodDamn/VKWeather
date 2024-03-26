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
    private static let mDateComps:
        Set<Calendar.Component> = [.day, .month]
    
    private let mLabelDate: UILabel!
    private let mCollectionForecast:
        UICollectionViewForecast!
    
    public final var date: Date? {
        didSet {
            guard let date = date else {
                return
            }
            
            let calendar = Calendar
                .current
            
            let comps = calendar
                .dateComponents(
                    UITableViewCellDay
                        .mDateComps,
                    from: date
                )
            
            let day = comps.day ?? -1
            let month = comps.month ?? -1
            
            mLabelDate.text =
                "\(day)/\(month)"
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
            width: frame.width,
            height: frame.width * 0.1
        )
        
        mLabelDate.fontSizeEqualsHeight()
    }
    
    private func ini() {
        mLabelDate.text = "Some date"
        mLabelDate.textColor = .black
        
        mCollectionForecast.backgroundColor =
            .brown
        
        contentView.addSubview(
            mLabelDate
        )
        
        contentView.addSubview(
            mCollectionForecast
        )
    }
    
}
