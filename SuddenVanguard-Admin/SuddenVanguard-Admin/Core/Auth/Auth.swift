//
//  Auth.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Foundation

protocol LogInAuth {
    func logIn(id: String, password: String) -> Bool
}

protocol AdminChecker {
    func checkAdmin() -> Bool
}

final class Auth {
    let checkID = Bundle.main.object(forInfoDictionaryKey: "ADMIN_ID") as? String ?? ""
    let checkPassword = Bundle.main.object(forInfoDictionaryKey: "ADMIN_PWD") as? String ?? ""
    
    var id = ""
    var password = ""
}

extension Auth: LogInAuth {
    func logIn(id: String, password: String) -> Bool {
        self.id = id
        self.password = password
        return checkAdmin()
    }
}

extension Auth: AdminChecker {
    func checkAdmin() -> Bool {
        return self.id == checkID && self.password == checkPassword
    }
}
