//
//  RegisterRepositoryImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Combine

struct RegisterRepositoryImp: RegisterRepository {
    private let apiClientService: ApiClientService
    
    init(apiClientService: ApiClientService) {
        self.apiClientService = apiClientService
    }
    
    func registerUser(request: RegisterRequest) -> AnyPublisher<RegisterResponse, Error> {
        let endPoint = RegisterEndPoint(request: request)
        guard let urlRequest = endPoint.toURLRequest else {
            return Fail(error: ApiError.errorInUrl).eraseToAnyPublisher()
        }
        
        return apiClientService
            .requestPublisher(request: urlRequest, type: RegisterDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
