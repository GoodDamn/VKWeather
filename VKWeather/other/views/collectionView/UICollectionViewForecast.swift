//
//  UICollectionViewForecast.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import UIKit

final public class UICollectionViewForecast
    : UICollectionView {
    
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
        
        delegate = self
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
    
}

extension UICollectionViewForecast
    : UICollectionViewDelegate {
    // for UICollectionViewDelegateFlowLayout
}

extension UICollectionViewForecast
    : UICollectionViewDelegateFlowLayout {
    
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let h = height() * 0.9
        return CGSize(
            width: h * 0.5,
            height: h
        )
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
        
        cell.temperature = model?
            .main.temp
            .celius()
        
        guard let iconId = model?
            .weather[0]
            .icon,
            let image = AppDelegate
                .mIconsMap[iconId] else {
                return cell
            }
        
        cell.image = image
        
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
