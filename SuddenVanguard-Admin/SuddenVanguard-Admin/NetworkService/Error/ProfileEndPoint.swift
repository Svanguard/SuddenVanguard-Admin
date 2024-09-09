//
//  ProfileEndPoint.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import Foundation

struct ProfileEndPoint: EndPoint {

    private let request: GetProfileRequest
    
    public var scheme: Scheme {
        .https
    }
    
    public var host: String {
        Bundle.main.object(forInfoDictionaryKey: "NEXON_URL") as? String ?? ""
    }
    
    public var port: String = ""
    
    public var path: String {
        "/api/Profile/GetProfileMain/\(request.suddenNumber)"
    }
    
    public var query: [String : String] = [:]
    
    public var header: [String : String] {
        [
            "Content-Type": "application/json"
        ]
    }
    
    public var body: [String : Any] = [:]
    
    public var method: HTTPMethod = .post
    
    public init(
        request: GetProfileRequest
    ) {
        self.request = request
    }
}
