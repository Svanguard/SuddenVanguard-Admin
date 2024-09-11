//
//  AdminUseCaseImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

struct AdminUseCaseImp: AdminUseCase {
    let service: AdminService
    
    init(service: AdminService) {
        self.service = service
    }
    
    func getAllData(request: GetAllDataRequest) -> AnyPublisher<[ProgramUserData], Error> {
        service.getAllData(request: request)
    }
    
    func deleteUser(request: DeleteRequest) -> AnyPublisher<[ProgramUserData], Error> {
        service.deleteUser(request: request)
    }
}
