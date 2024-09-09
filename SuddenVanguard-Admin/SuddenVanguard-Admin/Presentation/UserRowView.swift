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
        }
    }
}
