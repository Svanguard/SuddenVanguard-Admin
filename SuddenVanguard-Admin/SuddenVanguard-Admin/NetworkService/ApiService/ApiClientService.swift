//
//  ApiClientService.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Combine
import Foundation

protocol ApiClientService {
    func requestPublisher<T: Decodable>(request: URLRequest, type: T.Type) -> AnyPublisher<T, Error>
}
