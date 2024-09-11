//
//  GetAllDataDTO.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct GetAllDataDTO: Decodable {
    let resultCode: Int
    let resultMsg: String
    let resultData: [ProgramUserData]
}

extension GetAllDataDTO {
    func toDomain() -> GetAllDataResponse {
        .init(userDatas: resultData)
    }
}
