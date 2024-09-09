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
            if viewModel.searchQuery.isEmpty {
                Text("병영번호를 입력해주세요")
                    .foregroundStyle(.gray)
                    .font(.body)
                    .padding()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    NavigationLink(destination: {
                        EmptyView()
                    }) {
                        UserRowView(user: viewModel.userData)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("병영번호 검색")
        .navigationBarTitleDisplayMode(.inline)
    }
    
   
    
}
