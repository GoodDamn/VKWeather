//
//  UICollectionViewForecast.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final public class UICollectionViewForecast
    : UICollectionView {
    
    private var mCellSize: CGSize = .zero
    
    public final var forecast: [WeatherInfo]? {
        didSet {
            reloadData()
        }
    }
    
    public init(
        frame: CGRect
    ) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(
            frame: frame,
            collectionViewLayout: layout
        )
        
        dataSource = self
        
        register(
            UICollectionViewCellWeather.self,
            forCellWithReuseIdentifier:
                UICollectionViewCellWeather
                    .id
        )
        
    }
    
    public required init?(
        coder: NSCoder
    ) {
        super.init(
            coder: coder
        )
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        mCellSize.width = width() * 0.1
        mCellSize.height = mCellSize.width * 1.3
    }
}

extension UICollectionViewForecast
    : UICollectionViewDelegateFlowLayout {
    
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return mCellSize
    }
    
}


extension UICollectionViewForecast
    : UICollectionViewDataSource {
    
    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier:
                    UICollectionViewCellWeather
                        .id,
                for: indexPath
            ) as? UICollectionViewCellWeather else {
                return UICollectionViewCell()
            }
        
        let index = indexPath.row
        let model = forecast?[index]
        
        cell.hour = Calendar.hour(
            timeSince1970: model?.dt
        )
        
        return cell
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        let count = forecast?.count ?? 0
        print(
            UICollectionViewForecast.self,
            "numberOfItemsInSection",
            count
        )
        
        return count
    }
    
}
