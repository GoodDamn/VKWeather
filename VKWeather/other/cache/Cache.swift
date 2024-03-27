//
//  Cache.swift
//  VKWeather
//
//  Created by GoodDamn on 26/03/2024.
//

import Foundation

public class Cache {
    
    private let mCacheFile: String
    private let mPathSuper: String
    
    init(
        cacheFileName: String
    ) {
        let fm = FileManager.default
        let cacheUrl = fm.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        )[0]
        
        mCacheFile = cacheFileName
        mPathSuper = cacheUrl
            .appendingPathComponent(
                mCacheFile
            ).path
    }
    
    internal func cacheExists() -> Bool {
        return FileManager
            .default
            .fileExists(
                atPath: mPathSuper
            )
    }
    
    internal func cache(
        data: Data
    ) {
        FileManager
            .default
            .createFile(
                atPath: mPathSuper,
                contents: data
            )
    }
    
    internal func cache() -> Data? {
        FileManager
            .default
            .contents(
                atPath: mPathSuper
            )
    }
    
}
