//
//  Request.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import Foundation

final public class HTTPRequest {
    
    private static let TAG = "Request:"
    
    public static func make(
        url: URL,
        httpMethod: HTTPMethod = .get,
        completion: @escaping (Data) -> Void
    ) {
        
        // Executes on background thread
        func onResponse(
            data: Data?,
            response: URLResponse?,
            error: Error?
        ) -> Void {
            
            guard let data = data, error == nil else {
                print(
                    HTTPRequest.TAG,
                    url,
                    "data=nil with following error: \(error)"
                )
                return
            }
            
            completion(data)
        }
        
        var request = URLRequest(
            url: url
        )
        
        request.httpMethod = httpMethod
            .rawValue
        request.timeoutInterval = 5.0 // 5 seconds
        
        URLSession
            .shared
            .dataTask(
                with: request,
                completionHandler: onResponse
            )
    }
    
    
}
