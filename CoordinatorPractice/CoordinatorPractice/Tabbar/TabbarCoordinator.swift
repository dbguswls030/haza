//
//  TabbarCoordinator.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/17/25.
//

import Foundation
import SwiftUI

final class TabbarCoordinator: ObservableObject{
    @ObservedObject var parentCoordinator: AppCoordinator
    let diContainer: DIContainer
    @Published var selection: TabCase = .main
    
    init(parentCoordinator: AppCoordinator, diContainer: DIContainer) {
        self.parentCoordinator = parentCoordinator
        self.diContainer = diContainer
    }
    
    func start() -> some View{
        return TabView{
            MainView(
                coordinator: self.makeMainCoordinator(),
                viewModel: self.diContainer.makeMainViewModel()
            )
            .tabItem {
                Label("클립", systemImage: "folder")
            }
            
            MyPageView(
                coordinator: self.makeMyPageCoordinator(),
                viewModel: self.diContainer.makeMyPageViewModel()
            )
            .tabItem {
                Label("마이페이지", systemImage: "person")
            }            
        }
    }
    
    func makeMainCoordinator() -> MainCoordinator{
        return MainCoordinator(parentCoordinator: parentCoordinator, diContainer: diContainer)
    }
    
    func makeMyPageCoordinator() -> MyPageCoordinator{
        return MyPageCoordinator(parentCoordinator: parentCoordinator, diContainer: diContainer)
    }
}
