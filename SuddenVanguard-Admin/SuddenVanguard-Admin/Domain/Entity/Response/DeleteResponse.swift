//
//  DeleteResponse.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct DeleteResponse {
    let userDatas: [ProgramUserData]
    
    init(userDatas: [ProgramUserData]) {
        self.userDatas = userDatas
    }
}

