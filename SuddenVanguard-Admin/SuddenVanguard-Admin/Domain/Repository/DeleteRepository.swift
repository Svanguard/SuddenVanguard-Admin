//
//  DeleteRepository.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Combine

protocol DeleteRepository {
    func deleteUser(request: DeleteRequest) -> AnyPublisher<DeleteResponse, Error>
}
