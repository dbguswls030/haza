//
//  MainView.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/14/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var coordinator: MainCoordinator
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        Text("Main")
    }
}
