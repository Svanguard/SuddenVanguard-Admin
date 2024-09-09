//
//  Auth.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Foundation

protocol SessionCheckAuth {
    var isSessionActive: Bool { get }
}

protocol LogInAuth {
    func logIn()
}

protocol LogOutAuth {
   func logOut()
}

final class Auth {
    private var session = false
}

extension Auth: LogInAuth {
    func logIn() {
        session = true
    }
}

extension Auth: LogOutAuth {
    func logOut() {
        session = false
    }
}
