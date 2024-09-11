//
//  AdminServiceImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

struct AdminServiceImp: AdminService {
    let deleteRepository: DeleteRepository
    let getAllDataRepository: GetAllDataRepository
    
    init(
        deleteRepository: DeleteRepository,
        getAllDataRepository: GetAllDataRepository
    ) {
        self.deleteRepository = deleteRepository
        self.getAllDataRepository = getAllDataRepository
    }
    
    func getAllData(request: GetAllDataRequest) -> AnyPublisher<[ProgramUserData], Error> {
        return getAllDataRepository.getAllData(request: request)
            .map { $0.userDatas }
            .eraseToAnyPublisher()
    }
    
    func deleteUser(request: DeleteRequest) -> AnyPublisher<[ProgramUserData], Error> {
        return deleteRepository.deleteUser(request: request)
            .map { $0.userDatas }
            .eraseToAnyPublisher()
    }
}
