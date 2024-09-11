//
//  SearchUserData.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Foundation

struct SearchUserData: Identifiable, Hashable {
    let suddenNumber: Int
    let userName: String
    let userImage: String
    
    var id: String { "\(suddenNumber)" }

    init(
        suddenNumber: Int,
        userName: String,
        userImage: String
    ) {
        self.suddenNumber = suddenNumber
        self.userName = userName
        self.userImage = userImage
    }
}
