//
//  RegisterUseCase.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Combine

protocol RegisterUseCase {
    func registerUser()
    
    func searchNumberToSudden(suddenNumber: Int) -> AnyPublisher<SearchUserData, Error>
}
