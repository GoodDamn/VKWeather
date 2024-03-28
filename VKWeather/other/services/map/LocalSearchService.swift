//
//  LocalSearchService.swift
//  VKWeather
//
//  Created by GoodDamn on 26/03/2024.
//

import Foundation
import MapKit

final public class LocalSearchService {
    
    private let mSearchRequest: MKLocalSearch.Request
    
    public final weak var delegate:
        LocalSearchDelegate?
    
    init() {
        mSearchRequest = MKLocalSearch
            .Request()
        
    }
    
    public final func makeRequest(
        query: String
    ) {
        mSearchRequest.naturalLanguageQuery =
            query
        
        MKLocalSearch(
            request: mSearchRequest
        ).start {
            [weak self] resp, error in
            self?.onResponseItems(
                response: resp,
                error: error
            )
        }
        
    }
    
    private final func onResponseItems(
        response: MKLocalSearch.Response?,
        error: Error?
    ) {
        guard let response = response else {
            print(
                LocalSearchService.self,
                "Error response:",
                error
            )
            return
        }
        
        var result: [String] = []
        
        result.reserveCapacity(
            response
                .mapItems
                .count
        )
        
        for item in response.mapItems {
            
            guard let text = item.name else {
                return
            }
            
            result.append(
                text
            )
            
        }
        
        delegate?.onSearchResults(
            results: &result
        )
    }
    
}
