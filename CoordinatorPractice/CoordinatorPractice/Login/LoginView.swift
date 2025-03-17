//
//  LoginView.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/14/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var coordinator: LoginCoordinator
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack(path: $coordinator.path){
            Button {
                coordinator.showAgreementView()
            } label: {
                Text("agreement")
            }
            .navigationDestination(for: LoginScene.self) { loginScene in
                switch loginScene{
                case .agreement:
                    coordinator.makeAgreementView()
                case .login:
                    EmptyView()
                }
            }
        }
    }
}

//#Preview {
//    LoginView()
//}
