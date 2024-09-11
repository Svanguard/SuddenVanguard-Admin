//
//  GetAllDataRepositoryImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

struct GetAllDataRepositoryImp: GetAllDataRepository {
    private let apiClientService: ApiClientService
    
    init(apiClientService: ApiClientService) {
        self.apiClientService = apiClientService
    }
    
    func getAllData(request: GetAllDataRequest) -> AnyPublisher<GetAllDataResponse, Error> {
        let endPoint = GetAllDataEndPoint(request: request)
        guard let urlRequest = endPoint.toURLRequest else {
            return Fail(error: ApiError.errorInUrl).eraseToAnyPublisher()
        }
        
        return apiClientService
            .requestPublisher(request: urlRequest, type: GetAllDataDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()

    }
}
