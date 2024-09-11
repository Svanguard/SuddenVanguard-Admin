//
//  RegisterView.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        if #available(iOS 17.0, *) {
            NumberSearch
                .searchable(
                    text: $viewModel.searchQuery,
                    isPresented: $viewModel.isSearchFieldFocused,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "병영번호 검색"
                )
                .keyboardType(.numberPad)
        } else {
            NumberSearch
                .searchable(
                    text: $viewModel.searchQuery,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "병영번호 검색"
                )
                .keyboardType(.numberPad)
        }
    }
    
    @ViewBuilder
    private var NumberSearch: some View {
        VStack {
            if viewModel.checkData {
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                } else {
                    List {
                        Button {
                            viewModel.addUser(user: viewModel.userData)
                        } label: {
                            UserRowView(user: viewModel.userData)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            
            Spacer()
            
            if !viewModel.selectedUser.isEmpty {
                Text("현재 선택된 유저")
                    .foregroundStyle(.gray)
                    .font(.body)
                    .padding()
                
                List(viewModel.selectedUser) { user in
                    Button {
                        viewModel.removeUser(user: user)
                    } label: {
                        UserRowView(user: user)
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.3)
                .listStyle(.plain)
            }

            Button {
                viewModel.registerUser()
            } label: {
                Text("핵의심 유저 등록")
                    .padding()
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .background(Color(UIColor.loginButton).opacity(0.7))
            }
            .padding()
        }
        .navigationTitle("병영번호 검색")
        .navigationBarTitleDisplayMode(.inline)
    }
}
