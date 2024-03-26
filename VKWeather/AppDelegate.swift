//
//  AppDelegate.swift
//  VKWeather
//
//  Created by GoodDamn on 19/03/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    public static var mIconsMap =
        [String: UIImage?]()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [
            UIApplication.LaunchOptionsKey: Any
        ]?
    ) -> Bool {
        
        loadImageTheme(
            id: "01",
            imageDay: "sun.max",
            imageNight: "moon"
        )
        
        loadImageTheme(
            id: "02",
            imageDay: "cloud.sun",
            imageNight: "cloud.moon"
        )
        
        loadImage(
            id: "03",
            image: "cloud"
        )
        
        loadImage(
            id: "04",
            image: "cloud"
        )
        
        loadImageTheme(
            id: "10",
            imageDay: "cloud.rain",
            imageNight: "cloud.moon.rain"
        )
        
        loadImageTheme(
            id: "11",
            imageDay: "cloud.bolt.rain",
            imageNight: "cloud.moon.bolt"
        )
        
        loadImage(
            id: "50",
            image: "cloud.fog"
        )
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func loadImage(
        id: String,
        image: String
    ) {
        loadImageTheme(
            id: id,
            imageDay: image,
            imageNight: image
        )
    }

    private func loadImageTheme(
        id: String,
        imageDay: String,
        imageNight: String
    ) {
        AppDelegate.mIconsMap[
            "\(id)d"
        ] = UIImage(
            systemName: imageDay
        )
        
        AppDelegate.mIconsMap[
            "\(id)n"
        ] = UIImage(
            systemName: imageNight
        )
    }
    
}

