//
//  SearchFieldView.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

struct SearchFieldView: View {
    private let placeHolder: String
    private let opacityValue: CGFloat
    
    init(
        placeHolder: String,
        opacityValue: CGFloat
    ) {
        self.placeHolder = placeHolder
        self.opacityValue = opacityValue
    }
    
    var body: some View {
        
        Text(placeHolder)
            .font(.footnote)
            .foregroundStyle(.gray)
            .frame(width: UIScreen.main.bounds.width * 0.37)
            .padding()
            .border(Color(UIColor.searchBorder))
            .background(Color(UIColor.search).opacity(opacityValue))
            .padding(.top, 20)
    }
}
