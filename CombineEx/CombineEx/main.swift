//
//  main.swift
//  CombineEx
//
//  Created by 유현진 on 2/10/25.
//

import Foundation
import Combine
//
//let publisher = Just([1,2,3,4,5])
//
//_ = publisher
//    .sink { value in
//        print(value)
//    }

//let IntArrayPublisher = [10, 20, 30, 40, 50].publisher
//
//let cancellable = IntArrayPublisher
//    .map{$0 * 2}
//    .sink { value in
//        print(value)
//    }
//cancellable.cancel()


//let cancellable = Just(100)
//    .map{$0 + 50}
//    .sink { value in
//        print(value)
//    }
//    
//cancellable.cancel()

//struct Title: Codable{
//    let title: String
//}
//
//func getTitle() -> AnyPublisher<Title, Never>{
//    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
//    return Future<Title, Never>{ promise in
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in
//            guard let error = error else {
//                print(error?.localizedDescription)
//                return
//            }
//            guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
//                print("failed request")
//                return
//            }
//            guard let receieveTitle = try? JSONDecoder().decode(Title.self, from: data) else {
//                print("failed decoding")
//                return
//            }
//            promise(.success(receieveTitle))
//        }
//        task.resume()
//    }.eraseToAnyPublisher()
//}
//
//var cancellable = getTitle()
//    .map{$0.title}
//    .sink { title in
//        print(title)
//    }
//
//let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
//cancellable = URLSession.shared.dataTaskPublisher(for: url)
//    .map{$0.data}
//    .decode(type: Title.self, decoder: JSONDecoder())
//    .sink {
//        print($0)
//    } receiveValue: {
//        print($0)
//    }
//
//cancellable.cancel()
//

let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
var cancellables: AnyCancellable?

cancellables = timer
    .sink(receiveValue: {
        print($0)
    })

DispatchQueue.main.asyncAfter(deadline: .now()+5){
    cancellables?.cancel()
}


RunLoop.main.run()
