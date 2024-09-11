//
//  MainView.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            if !viewModel.adminSession {
                VStack {
                    VStack {
                        Spacer()
                        Image(uiImage: UIImage.vanguardlogo)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .scaledToFit()
                        
                        Text("서든 뱅가드 관리자 앱입니다")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        signView()
                            .padding(.bottom)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                    .background(
                        Image(uiImage: UIImage.bg)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    )
                    Spacer()
                }
            } else {
                AdminView()
            }
        }
        .tint(.white)
    }
    
    @ViewBuilder
    private func signView() -> some View {
        VStack {
            TextField("아이디",
                      text: $viewModel.adminID,
                      prompt: Text("아이디").foregroundColor(.gray)
            )
            .foregroundColor(.white)
            .autocapitalization(.none)
            .textCase(.lowercase)
            .disableAutocorrection(false)
            .font(.footnote)
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .padding()
            .border(Color(UIColor.searchBorder))
            .background(Color(UIColor.search))
            .padding(.top, 20)
            
            SecureField("비밀번호",
                        text: $viewModel.adminPWD,
                        prompt: Text("비밀번호").foregroundColor(.gray)
            )
            .foregroundColor(.white)
            .autocapitalization(.none)
            .textCase(.lowercase)
            .disableAutocorrection(false)
            .font(.footnote)
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .padding()
            .border(Color(UIColor.searchBorder))
            .background(Color(UIColor.search).opacity(0.2))
            .padding(.top, 20)
            
            Button {
                viewModel.login()
            } label: {
                Text("로그인")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .background(Color(UIColor.loginButton).opacity(0.7))
                    .padding(.top, 20)
            }
        }
    }
}
