//
//  MainViewModel.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Injected(Auth.self)
    var auth: Auth

    @Published var adminID: String = ""
    @Published var adminPWD: String = ""
    @Published var adminSession: Bool = false
    
    func login() {
        adminSession = auth.logIn(id: adminID, password: adminPWD)
    }
}
