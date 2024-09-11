//
//  DeleteRepositoryImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

struct DeleteRepositoryImp: DeleteRepository {
    private let apiClientService: ApiClientService
    
    init(apiClientService: ApiClientService) {
        self.apiClientService = apiClientService
    }
    
    func deleteUser(request: DeleteRequest) -> AnyPublisher<DeleteResponse, Error> {
        let endPoint = DeleteEndPoint(request: request)
        guard let urlRequest = endPoint.toURLRequest else {
            return Fail(error: ApiError.errorInUrl).eraseToAnyPublisher()
        }
        
        return apiClientService
            .requestPublisher(request: urlRequest, type: DeleteDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

}
