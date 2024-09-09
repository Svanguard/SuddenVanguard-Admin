//
//  RegisterViewModel.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var isSearchFieldFocused = true
    @Published var isLoading = false
    @Published var userData: SearchUserData = .init(suddenNumber: 0, userName: "", userImage: "")
}
