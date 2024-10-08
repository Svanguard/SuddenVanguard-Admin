//
//  RegisterServiceImp.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Combine

final class RegisterServiceImp: RegisterService {
    
    private let getProfileDataRepository: GetProfileDataRepository
    private let registerRepository: RegisterRepository
    
    init(
        getProfileDataRepository: GetProfileDataRepository,
        registerRepository: RegisterRepository
    ) {
        self.getProfileDataRepository = getProfileDataRepository
        self.registerRepository = registerRepository
    }
    
    func searchNumberToSudden(suddenNumber: Int) -> AnyPublisher<SearchUserData, Error> {
        return getProfileDataRepository.getProfileData(request: .init(suddenNumber: suddenNumber))
            .map { response in
                return SearchUserData(
                    suddenNumber: suddenNumber,
                    userName: response.userName,
                    userImage: response.userImage
                )
            }
            .eraseToAnyPublisher()
    }
    
    func registerUser(request: RegisterRequest) -> AnyPublisher<[ProgramUserData], Error> {
        return registerRepository.registerUser(request: request)
            .map { $0.userDatas }
            .eraseToAnyPublisher()
    }
}
