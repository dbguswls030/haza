//
//  main.swift
//  SyncAsyncSubject
//
//  Created by 유현진 on 2/10/25.
//

import Foundation

DispatchQueue.global().async{
    (1...5).forEach{ print($0) }
    
    DispatchQueue.main.async{
        print("UI 작업 완료")
    }
    sleep(3)
}

RunLoop.main.run()
