//
//  MyPageView.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/17/25.
//

import SwiftUI

struct MyPageView: View {
    @ObservedObject var coordinator: MyPageCoordinator
    @StateObject var viewModel: MyPageViewModel
    
    var body: some View {
        Button {
            coordinator.logout()
        } label: {
            Text("다시 로그인 화면 복귀")
        }
    }
}
