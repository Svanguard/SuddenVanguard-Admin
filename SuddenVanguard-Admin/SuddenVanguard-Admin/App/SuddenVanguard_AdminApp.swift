//
//  SuddenVanguard_AdminApp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

@main
struct SuddenVanguard_AdminApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
