//
//  SearchUserData.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Foundation

struct SearchUserData: Identifiable, Hashable {
    public let suddenNumber: Int
    public let userName: String
    public let userImage: String
    
    public var id: String { "\(suddenNumber)" }

    public init(
        suddenNumber: Int,
        userName: String,
        userImage: String
    ) {
        self.suddenNumber = suddenNumber
        self.userName = userName
        self.userImage = userImage
    }
}
