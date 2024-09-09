//
//  RegisterViewModel.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Combine
import SwiftUI

final class RegisterViewModel: ObservableObject {
    @Injected(Auth.self)
    var auth: Auth
    
    @Injected(RegisterUseCase.self)
    var useCase: RegisterUseCase
    
    @Published var searchQuery = ""
    @Published var isSearchFieldFocused = true
    @Published var isLoading = false
    @Published var userData: SearchUserData = .init(suddenNumber: 0, userName: "", userImage: "")
    
    private var cancellables = Set<AnyCancellable>()
    private let debounceDelay: TimeInterval = 0.5
    
    init() {
        setupSearchDebounce()
    }
    
    private func searchNumberToSudden() {
        guard let suddenNumber = Int(searchQuery), !searchQuery.isEmpty else {
            return
        }
        useCase.searchNumberToSudden(suddenNumber: suddenNumber)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    print("서든병영 데이터 패치 에러: \(error)")
                }
            } receiveValue: { [weak self] userData in
                self?.isLoading = false
                self?.userData = userData
            }
            .store(in: &cancellables)
    }
    
    private func setupSearchDebounce() {
        $searchQuery
            .debounce(for: .seconds(debounceDelay), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self else { return }
                self.searchNumberToSudden()
            }
            .store(in: &cancellables)
    }
}
