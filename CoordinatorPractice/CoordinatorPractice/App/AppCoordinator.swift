//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/14/25.
//

import Foundation
import SwiftUI

final class AppCoordinator: ObservableObject{
    @Published var isLoggedIn: Bool = false
    @Published var curScene: AppScene = .empty
    
    let diContainer: DIContainer
    
    init(diContainer: DIContainer) {
        self.diContainer = diContainer
        getUseStatus()
        updatePathBasedLogin()
    }
    
    func updatePathBasedLogin(){
        if isLoggedIn{
            curScene = .main
        }else{
            curScene = .login
        }
    }
    
    func getUseStatus(){
        isLoggedIn = false
    }
    
    func makeLoginCoordinator() -> LoginCoordinator{
        return LoginCoordinator(parentCoordinator: self, diContainer: diContainer)
    }
    
    func makeTabbarCoordinator() -> TabbarCoordinator{
        return TabbarCoordinator(parentCoordinator: self, diContainer: diContainer)
    }
    
}
