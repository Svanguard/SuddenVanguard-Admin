//
//  GetProfileDataRepositoryImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Combine

struct GetProfileDataRepositoryImp: GetProfileDataRepository {
    private let apiClientService: ApiClientService
    
    init(apiClientService: ApiClientService) {
        self.apiClientService = apiClientService
    }
    
    func getProfileData(request: GetProfileRequest) -> AnyPublisher<ProfileResponse, Error> {
        let endPoint = ProfileEndPoint(request: request)
        
        guard let urlRequest = endPoint.toURLRequest else {
            return Fail(error: ApiError.errorInUrl).eraseToAnyPublisher()
        }
        
        return apiClientService
            .requestPublisher(request: urlRequest, type: ProfileDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
