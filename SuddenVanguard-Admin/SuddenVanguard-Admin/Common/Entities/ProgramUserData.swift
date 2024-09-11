//
//  ProgramUserData.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct ProgramUserData: Identifiable, Hashable, Decodable {
    let userNexonSn: String
    let insertDt: String
    
    public var id: String { "\(userNexonSn)" }

}
