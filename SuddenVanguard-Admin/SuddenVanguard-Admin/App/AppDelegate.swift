//
//  AppDelegate.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/9/24.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        registerDependencies()
        return true
    }
    
    func registerDependencies() {
        let auth = Auth()
        let apiClientService: ApiClientService = ApiClientServiceImp()
        
        // MARK: - Repository
        let getProfileDataRepository: GetProfileDataRepository = GetProfileDataRepositoryImp(apiClientService: apiClientService)
       
        // MARK: - Service
        let registerService: RegisterService = RegisterServiceImp(getProfileDataRepository: getProfileDataRepository)
        
        // MARK: - UseCase
        let registerUseCase: RegisterUseCase = RegisterUseCaseImp(service: registerService)
        
        DIContainer.register(
            type: Auth.self,
            auth
        )
        
        DIContainer.register(
            type: RegisterUseCase.self,
            registerUseCase
        )
    }

}
