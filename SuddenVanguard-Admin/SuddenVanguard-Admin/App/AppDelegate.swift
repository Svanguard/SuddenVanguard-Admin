//
//  AppDelegate.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        registerDependencies()
        return true
    }
    
    func registerDependencies() {
    }
}
