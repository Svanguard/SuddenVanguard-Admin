//
//  GetAllDataEndPoint.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/11/24.
//

import Foundation

struct GetAllDataEndPoint: EndPoint {
    private let request: GetAllDataRequest
    
    public var scheme: Scheme {
        .http
    }
    
    public var host: String {
        Bundle.main.object(forInfoDictionaryKey: "HOST_VALUE") as? String ?? ""
    }
    
    public var port: String {
        Bundle.main.object(forInfoDictionaryKey: "PORT_NUMBER") as? String ?? ""
    }
    public var path: String {
        "/api/v1/ban-users"
    }
    
    public var query: [String : String] = [:]
    
    public var header: [String : String] {
        [
            "Content-Type": "application/json"
        ]
    }
    
    public var body: [String : Any] {
        [
            "adminId": request.adminId,
            "adminPassword": request.adminPassword
        ]
    }
    
    public var method: HTTPMethod = .post
    
    public init(
        request: GetAllDataRequest
    ) {
        self.request = request
    }
}
