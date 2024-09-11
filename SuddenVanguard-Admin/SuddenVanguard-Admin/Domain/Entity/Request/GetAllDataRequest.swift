//
//  GetAllDataRequest.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct GetAllDataRequest {
    let adminId: String
    let adminPassword: String
    
    init(adminId: String, adminPassword: String) {
        self.adminId = adminId
        self.adminPassword = adminPassword
    }
}
