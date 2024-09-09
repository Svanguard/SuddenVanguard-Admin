//
//  MainViewModel.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var adminID: String = ""
    @Published var adminPWD: String = ""
}
