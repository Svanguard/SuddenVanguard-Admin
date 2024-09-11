//
//  RegisterUseCaseImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Combine

struct RegisterUseCaseImp: RegisterUseCase {
    private let service: RegisterService
 
    init(service: RegisterService) {
        self.service = service
    }
    
    func searchNumberToSudden(suddenNumber: Int) -> AnyPublisher<SearchUserData, Error> {
        service.searchNumberToSudden(suddenNumber: suddenNumber)
    }
    
    func registerUser(request: RegisterRequest) -> AnyPublisher<[ProgramUserData], Error> {
        service.registerUser(request: request)
    }
}
