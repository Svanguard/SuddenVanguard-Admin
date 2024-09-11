//
//  AdminViewModel+RegisterViewDelegate.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/12/24.
//

import Foundation

extension AdminViewModel: RegisterViewDelegate {
    func didRegisterUsers(_ users: [ProgramUserData]) {
        self.registeredUsers = users
    }
}
