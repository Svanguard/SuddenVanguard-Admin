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
    @Published var checkData = false
    @Published var selectedUser: [SearchUserData] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let debounceDelay: TimeInterval = 0.5
    
    init() {
        setupSearchDebounce()
    }

    func addUser(user: SearchUserData) {
        if !checkDuplicate(user: user) {
            selectedUser.append(user)
            clearUserData()
        }
    }
    
    func removeUser(user: SearchUserData) {
        selectedUser = selectedUser.filter { $0 != user }
    }
    
    func registerUser() {
        guard !selectedUser.isEmpty else { return }
        
        useCase.registerUser(request:
                .init(
                    adminId: auth.id,
                    adminPassword: auth.password,
                    userNexonSn: selectedUser.map { String($0.suddenNumber) }
                )
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            guard let self = self else { return }
            
            switch completion {
            case .failure(let error):
                print("유저 등록 실패: \(error)")
            case .finished:
                self.selectedUser.removeAll()
                self.userData = .init(suddenNumber: 0, userName: "", userImage: "")
                self.checkUserData()
            }
        } receiveValue: { response in
            print("유저 등록 성공: \(response)")
        }
        .store(in: &cancellables)
    }
    
    private func clearUserData() {
        searchQuery = ""
        userData = .init(suddenNumber: 0, userName: "", userImage: "")
        checkUserData()
    }
    
    private func checkDuplicate(user: SearchUserData) -> Bool {
        selectedUser.contains(user)
    }
    
    private func checkUserData() {
        if userData == .init(suddenNumber: 0, userName: "", userImage: "") {
            checkData = false
        } else {
            checkData = true
        }
    }
    
    private func searchNumberToSudden() {
        guard let suddenNumber = Int(searchQuery), !searchQuery.isEmpty else {
            return
        }
        useCase.searchNumberToSudden(suddenNumber: suddenNumber)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("서든병영 데이터 패치 에러: \(error)")
                    self.userData = .init(suddenNumber: 0, userName: "", userImage: "")
                    self.checkUserData()
                }
            } receiveValue: { [weak self] userData in
                guard let self = self else { return }
                self.isLoading = false
                self.userData = userData
                self.checkUserData()
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
