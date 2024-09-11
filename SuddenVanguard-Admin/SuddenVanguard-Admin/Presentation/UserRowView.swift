//
//  UserRowView.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import Kingfisher
import SwiftUI

struct UserRowView: View {
    let user: SearchUserData
    
    @State private var showSafari = false

    var body: some View {
        HStack {
            KFImage(URL(string: user.userImage))
                .placeholder {
                    Image("userimg")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                Text(user.userName)
                    .font(.headline)
                
                let formattedNexonSN = String(user.suddenNumber).replacingOccurrences(of: ",", with: "")
                Text("병영 번호: \(formattedNexonSN)")
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.leading, 8)
            
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
                SafariView(url: URL(string: "https://barracks.sa.nexon.com/\(user.suddenNumber)/match")!)
            }
        }
    }
}
