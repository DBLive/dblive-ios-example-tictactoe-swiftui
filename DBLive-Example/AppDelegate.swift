//
//  AppDelegate.swift
//  DBLive-Example
//
//  Created by Mike Richards on 5/26/20.
//  Copyright © 2020 DBLive. All rights reserved.
//

import UIKit
import DBLive

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	static var instance: AppDelegate {
		get { return UIApplication.shared.delegate as! AppDelegate }
	}
	
	let dbLive = DBLiveClient(appKey: "+EzwYKZrXI7eKn/KRtlhURsGsjyP2e+1++vqTDQH")

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

}

