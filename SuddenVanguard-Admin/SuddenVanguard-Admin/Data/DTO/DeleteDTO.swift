//
//  DeleteDTO.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct DeleteDTO: Decodable {
    let resultCode: Int
    let resultMsg: String
    let resultData: [ProgramUserData]
}

extension DeleteDTO {
    func toDomain() -> DeleteResponse {
        .init(userDatas: resultData)
    }
}
