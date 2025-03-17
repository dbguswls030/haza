//
//  DIContainer.swift
//  CoordinatorPractice
//
//  Created by 유현진 on 3/17/25.
//

import Foundation

final class DIContainer{
    
    func makeLoginViewModel() -> LoginViewModel{
        return LoginViewModel()
    }
    
    func makeAgreementViewModel() -> AgreementViewModel{
        return AgreementViewModel()
    }
    
    func makeMainViewModel() -> MainViewModel{
        return MainViewModel()
    }
    
    func makeMyPageViewModel() -> MyPageViewModel{
        return MyPageViewModel()
    }
}
