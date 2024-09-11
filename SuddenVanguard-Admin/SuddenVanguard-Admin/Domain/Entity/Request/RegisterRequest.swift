//
//  RegisterRequest.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Foundation

struct RegisterRequest {
    let adminId: String
    let adminPassword: String
    let userNexonSn: [String]
  
    init(
        adminId: String,
        adminPassword: String,
        userNexonSn: [String]
    ) {
        self.adminId = adminId
        self.adminPassword = adminPassword
        self.userNexonSn = userNexonSn
    }
}
