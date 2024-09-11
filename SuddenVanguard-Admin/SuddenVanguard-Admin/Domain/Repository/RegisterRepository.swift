//
//  RegisterRepository.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Combine

protocol RegisterRepository {
    func registerUser(request: RegisterRequest) -> AnyPublisher<RegisterResponse, Error>
}
