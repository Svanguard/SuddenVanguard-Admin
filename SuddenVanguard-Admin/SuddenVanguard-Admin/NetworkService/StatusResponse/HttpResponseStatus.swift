//
//  HttpResponseStatus.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let existedUser = 409
    static let clientError = 400...499
    static let serverError = 500...599
}
