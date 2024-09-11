//
//  AdminService.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

protocol AdminService {
    func getAllData(request: GetAllDataRequest) -> AnyPublisher<[ProgramUserData], Error>
    func deleteUser(request: DeleteRequest)  -> AnyPublisher<[ProgramUserData], Error>
}
