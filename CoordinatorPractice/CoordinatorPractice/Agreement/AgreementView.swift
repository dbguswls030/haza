//
//  AgreementView.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/17/25.
//

import SwiftUI

struct AgreementView: View {
    @ObservedObject var coordinator: LoginCoordinator
    @StateObject var viewModel: AgreementViewModel
    
    var body: some View {
        Text("AgreementView")
        
        Button {
            coordinator.parentCoordinator.curScene = .main
        } label: {
            Text("로그인 성공")
        }
    }
}
