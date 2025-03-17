//
//  MyPageCoordinator.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/17/25.
//

import Foundation
import SwiftUI

final class MyPageCoordinator: ObservableObject{
    @ObservedObject var parentCoordinator: AppCoordinator
    let diContainer: DIContainer
    
    init(parentCoordinator: AppCoordinator, diContainer: DIContainer) {
        self.parentCoordinator = parentCoordinator
        self.diContainer = diContainer
    }
    
    func logout() {
        parentCoordinator.curScene = .login
    }
}
