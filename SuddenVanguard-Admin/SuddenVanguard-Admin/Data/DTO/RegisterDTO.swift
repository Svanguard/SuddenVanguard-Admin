//
//  RegisterDTO.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Foundation

struct RegisterDTO: Decodable {
    let resultCode: Int
    let resultMsg: String
    let resultData: [ProgramUserData]
}

extension RegisterDTO {
    func toDomain() -> RegisterResponse {
        .init(userDatas: resultData)
    }
}
