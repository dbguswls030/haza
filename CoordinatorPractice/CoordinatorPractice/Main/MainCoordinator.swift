//
//  MainCoordinator.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/14/25.
//

import Foundation
import SwiftUI

final class MainCoordinator: ObservableObject{
    @ObservedObject var parentCoordinator: AppCoordinator
    let diContainer: DIContainer
    
    init(parentCoordinator: AppCoordinator, diContainer: DIContainer) {
        self.parentCoordinator = parentCoordinator
        self.diContainer = diContainer
    }
}
