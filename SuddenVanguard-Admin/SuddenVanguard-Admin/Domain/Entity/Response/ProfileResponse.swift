//
//  SearchNumberResponse.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Foundation

struct ProfileResponse {
    let userName: String
    let userImage: String
    
    init(
        userName: String,
        userImage: String
    ) {
        self.userName = userName
        self.userImage = userImage
    }
}
