//
//  BaseModelService.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

public class BaseModelService <
    MODEL: Codable
> {
    
    internal final func startService(
        url: URL?
    ) {
        guard let url = url else {
            print(
                "BaseModelService:",
                "URL_MAKER_ERROR"
            )
            return
        }
        
        HTTPRequest.make(
            url: url,
            completion: onCompletionData(data:)
        )
    }
    
    // Executes on background thread
    private final func onCompletionData(
        data: Data
    ) {
        do {
            let model = try JSONDecoder()
                .decode(
                    MODEL.self,
                    from: data
                )
            onGetModelBackground(
                model: model
            )
        } catch {
            print(
                "BaseModelService:",
                "Unable to decode WeatherInfo JSON",
                error
            )
            onGetModelBackground(
                model: nil
            )
        }
    }
    
    internal func onGetModelBackground(
        model: MODEL?
    ) {}
    
}
