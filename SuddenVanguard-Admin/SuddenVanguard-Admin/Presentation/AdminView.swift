//
//  AdminView.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import SwiftUI

struct AdminView: View {
    @StateObject var viewModel = AdminViewModel()
    
    @State private var showSafari = false

    var body: some View {
        VStack {
            HStack {
                Text("현재 핵의심 유저 목록")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.registeredUsers) { user in
                    Button {
                        viewModel.toggleSelection(for: user)
                    } label: {
                        registeredUserView(userData: user)
                            .background(viewModel.selectedUsers.contains(user) ? Color.gray.opacity(0.3) : Color.clear)
                            .cornerRadius(3)

                    }
                }
                .listStyle(.plain)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                NavigationLink {
                    RegisterView()
                } label: {
                    AdminButtonView(
                        placeHolder: "핵의심 유저 등록",
                        opacityValue: 1.0
                    )
                }
                
                Spacer()
                
                Button {
                    viewModel.deleteUsers()
                } label: {
                    AdminButtonView(
                        placeHolder: "핵의심 유저 제거",
                        opacityValue: viewModel.selectedUsers.isEmpty ? 0.2 : 1.0,
                        backgroundColor: viewModel.selectedUsers.isEmpty ? Color(UIColor.search).opacity(0.2) : Color(UIColor.loginButton).opacity(0.7)
                    )
                }
                .disabled(viewModel.selectedUsers.isEmpty)
                
                Spacer()
            }
            .padding(.bottom)
        }
    }
    
    @ViewBuilder
    private func registeredUserView(userData: ProgramUserData) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                let formattedNexonSN = String(userData.userNexonSn).replacingOccurrences(of: ",", with: "")
                Text("병영 번호: \(formattedNexonSN)")
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                Text("등록일: \(userData.insertDt)")
                    .font(.caption)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(5)
            
            Spacer()
            
            Button {
                HapticFeedbackManager.shared.triggerHapticFeedback()
                showSafari = true
            } label: {
                Text("병영 수첩")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .foregroundStyle(.primary)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.7)
                    )
            }
            .padding(5)
            .contentShape(Rectangle())
            .onTapGesture {
                HapticFeedbackManager.shared.triggerHapticFeedback()
                showSafari = true
            }
            .simultaneousGesture(TapGesture().onEnded { })
            .sheet(isPresented: $showSafari) {
                SafariView(url: URL(string: "https://barracks.sa.nexon.com/\(userData.userNexonSn)/match")!)
            }
        }
    }
}
