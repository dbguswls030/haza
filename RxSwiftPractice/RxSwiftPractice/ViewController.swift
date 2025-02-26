//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by 유현진 on 2/24/25.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    let fromObservable: Observable = Observable.from([1,2,3])
    
    let createObservable = Observable<String>.create { observer in
        observer.onNext("1")
        observer.onNext("2")
        observer.onCompleted()
        observer.onNext("3")
        return Disposables.create()
    }
    
    let publishSubject = PublishSubject<String>()
    
    let behaviorSubject = BehaviorSubject<String>(value: "")
    
    let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        replaySubject.onNext("1")
        replaySubject.onNext("2")
        replaySubject.onNext("3")
        replaySubject.subscribe(onNext: {
            print($0)
        }).disposed(by: self.disposeBag)
        replaySubject.onNext("4")
        
    }
}

