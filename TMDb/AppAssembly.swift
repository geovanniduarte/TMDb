//
//  AppAssembly.swift
//  TMDb
//
//  Created by DesarrolloMac1 on 26/05/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
    
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var rootViewController  = UINavigationController()
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: rootViewController)
    
    func setupRootViewController() {
        // TODO: implement
        let featuredViewController = coreAssembly.featuredAssembly.viewController()
        rootViewController.pushViewController(featuredViewController, animated: true)
        window.rootViewController = rootViewController
    }
    
    /*
     let initialViewController = appAssembly.coreAssembly.featuredAssembly.viewController()
     appAssembly.rootViewController.pushViewController(initialViewController, animated: true)
     
     appAssembly.window.rootViewController = appAssembly.rootViewController
     appAssembly.window.makeKeyAndVisible()
    */
    
}
