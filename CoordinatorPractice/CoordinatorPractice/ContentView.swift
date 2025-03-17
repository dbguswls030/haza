//
//  CoordinatorPracticeApp.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/14/25.
//

import SwiftUI

@main
struct ContentView: App {
    @ObservedObject var coordinator: AppCoordinator = AppCoordinator(diContainer: DIContainer())
    
    var body: some Scene {
        WindowGroup {
            switch coordinator.curScene{
            case .login:
                LoginView(
                    coordinator: coordinator.makeLoginCoordinator(),
                    viewModel: coordinator.diContainer.makeLoginViewModel()
                )
            case .main:
                EmptyView()
                TabbarCoordinator(
                    parentCoordinator: coordinator,
                    diContainer: coordinator.diContainer).start()
            case .empty:
                EmptyView()
            }
        }
    }
}
