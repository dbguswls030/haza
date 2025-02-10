//
//  main.swift
//  NetworkingSubject
//
//  Created by 유현진 on 2/10/25.
//

import Foundation

DispatchQueue.global().async{
    for second in 1...3{
        print("\(second)...")
        sleep(1)
    }
    DispatchQueue.main.async {
        print("데이터 로드 완료")
    }
    sleep(5)
}
RunLoop.main.run()
