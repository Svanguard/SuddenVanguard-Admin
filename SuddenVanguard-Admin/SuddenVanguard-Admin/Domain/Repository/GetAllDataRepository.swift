//
//  GetAllDataRepository.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

protocol GetAllDataRepository {
    func getAllData(request: GetAllDataRequest) -> AnyPublisher<GetAllDataResponse, Error>
}
