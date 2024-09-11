//
//  RegisterResponse.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Foundation

struct RegisterResponse {
    let userDatas: [ProgramUserData]
    
    init(userDatas: [ProgramUserData]) {
        self.userDatas = userDatas
    }
}
