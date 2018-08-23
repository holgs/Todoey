//
//  AppDelegate.swift
//  Todoey
//
//  Created by Holger Ferrero on 01/08/2018.
//  Copyright © 2018 Holger Ferrero. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
        
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising Realm \(error)")
        }
        
        return true
    }

}

