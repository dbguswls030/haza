//
//  LoginCoordinator.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/14/25.
//

import Foundation
import SwiftUI

final class LoginCoordinator: ObservableObject{
    @ObservedObject var parentCoordinator: AppCoordinator
    @Published var path: [LoginScene] = []
    
    let diContainer: DIContainer
    
    init(parentCoordinator: AppCoordinator, diContainer: DIContainer) {
        self.parentCoordinator = parentCoordinator
        self.diContainer = diContainer
    }
    
    func showAgreementView(){
        path.append(.agreement)
    }
    
    func makeAgreementView() -> some View{
        return AgreementView(
            coordinator: self,
            viewModel: self.diContainer.makeAgreementViewModel()
        )
    }
    
}
