//
//  GetProfileDataRepository.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Combine

protocol GetProfileDataRepository {
    func getProfileData(request: GetProfileRequest) -> AnyPublisher<ProfileResponse, Error>
}
