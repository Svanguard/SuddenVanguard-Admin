//
//  AdminButtonView.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

struct AdminButtonView: View {
    private let placeHolder: String
    private let opacityValue: CGFloat
    private let backgroundColor: Color
    
    init(
        placeHolder: String,
        opacityValue: CGFloat,
        backgroundColor: Color = Color(UIColor.search)
    ) {
        self.placeHolder = placeHolder
        self.opacityValue = opacityValue
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Text(placeHolder)
            .font(.footnote)
            .foregroundStyle(.gray)
            .frame(width: UIScreen.main.bounds.width * 0.37)
            .padding()
            .border(Color(UIColor.searchBorder))
            .background(backgroundColor)
            .padding(.top, 20)
    }
}
