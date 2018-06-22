//
//  AppDelegate.swift
//  Cars
//
//  Created by Luis Henrique on 18/06/2018.
//  Copyright © 2018 Luis Henrique. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        // create controllers
        let listController = CarListViewController(nibName: "CarListViewController", bundle: nil)
        let aboutController = AboutViewController(nibName: "AboutViewController", bundle: nil)
        let nav1 = UINavigationController()
        let nav2 = UINavigationController()
        // insert two view controllers in navigations controllers
        nav1.pushViewController(listController, animated: false)
        nav2.pushViewController(aboutController, animated: false)
        // create the TabBar
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [nav1,nav2]
        nav1.tabBarItem.title = "Carros"
        nav1.tabBarItem.image = UIImage(named: "tab_carros.png")
        nav2.tabBarItem.title = "Sobre"
        nav2.tabBarItem.image = UIImage(named: "tab_sobre.png")
        // configure the UITabBarController how the diretor view controller
        self.window!.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

