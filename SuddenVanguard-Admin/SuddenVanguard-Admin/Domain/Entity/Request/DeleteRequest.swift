//
//  DeleteRequest.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct DeleteRequest {
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
