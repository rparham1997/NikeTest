//
//  AppDelegate.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        // Initialize the navigation stack.
        let navigationController = UINavigationController()
        let albumsViewController = AlbumsViewController()
        navigationController.viewControllers = [albumsViewController]
        
        // Initialize the window.
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

