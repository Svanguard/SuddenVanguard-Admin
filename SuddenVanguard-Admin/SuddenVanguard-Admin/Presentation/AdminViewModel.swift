//
//  AdminViewModel.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Combine
import SwiftUI

final class AdminViewModel: ObservableObject {
    @Injected(Auth.self)
    var auth: Auth
    
    @Injected(AdminUseCase.self)
    var useCase: AdminUseCase
    
    @Published var isLoading = false
    @Published var registeredUsers: [ProgramUserData] = []
    @Published var selectedUsers: [ProgramUserData] = []
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        getAllData()
    }
    
    func getAllData() {
        isLoading = true
        useCase.getAllData(request:
                .init(
                    adminId: auth.id,
                    adminPassword: auth.password
                )
        )
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    print("서버에서 데이터 패치 실패: \(error)")
                }
                self.isLoading = false
            } receiveValue: { [weak self] userDatas in
                guard let self = self else { return }
                self.selectedUsers.removeAll()
                self.registeredUsers = userDatas
                self.isLoading = false

            }
            .store(in: &cancellables)
    }

    func deleteUsers() {
        isLoading = true
        useCase.deleteUser(request:
                .init(
                    adminId: auth.id,
                    adminPassword: auth.password,
                    userNexonSn: selectedUsers.map { $0.userNexonSn }
                )
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            guard let self = self else { return }
            if case .failure(let error) = completion {
                print("의심 유저 삭제 실패: \(error)")
            }
            self.isLoading = false
        } receiveValue: { [weak self] userDatas in
            guard let self = self else { return }
            self.selectedUsers.removeAll()
            self.registeredUsers = userDatas
            self.isLoading = false
        }
        .store(in: &cancellables)
    }
    
    func refreshData() {
        getAllData()
    }
    
    func toggleSelection(for user: ProgramUserData) {
          if let index = selectedUsers.firstIndex(of: user) {
              selectedUsers.remove(at: index)
          } else {
              selectedUsers.append(user)
          }
      }
}
