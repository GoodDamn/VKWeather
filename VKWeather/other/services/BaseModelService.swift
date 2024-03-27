//
//  BaseModelService.swift
//  VKWeather
//
//  Created by GoodDamn on 25/03/2024.
//

import Foundation

public class BaseModelService <
    MODEL: Codable
> : Cache {
    
    
    internal override init(
        cacheFileName: String
    ) {
        super.init(
            cacheFileName: cacheFileName
        )
    }
    
    internal final func startService(
        url: URL?
    ) {
        guard let url = url else {
            print(
                BaseModelService.self,
                "URL_MAKER_ERROR"
            )
            return
        }
        
        if cacheExists(), let data = cache() {
            DispatchQueue.global(
                qos: .default
            ).async { [weak self] in
                self?.onDecodeJson(
                    data: data
                )
            }
        }
        
        HTTPRequest.make(
            url: url,
            completion: onCompletionDownload(
                data:
            )
        )
    }
    
    
    internal func onGetModelBackground(
        model: MODEL?
    ) {}
    
    // Executes on background thread
    private final func onDecodeJson(
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
                BaseModelService.self,
                "Unable to decode WeatherInfo JSON",
                error
            )
            onGetModelBackground(
                model: nil
            )
        }
    }
    
    // Executes on background thread
    private final func onCompletionDownload(
        data: Data
    ) {
        cache(
            data: data
        )
        
        onDecodeJson(
            data: data
        )
    }
    
}
