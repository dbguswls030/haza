//
//  ViewController.swift
//  카운터 앱
//
//  Created by 유현진 on 2/11/25.
//

import UIKit
enum Counter{ // 증가, 감소 케이스
    case up
    case down
    case reset
}
class ViewController: UIViewController {
    private var number = 0
    private let maxNumber = 10 // 최댓값
    private let minNumber = -5 // 최솟값
    private lazy var counterView: CounterView = {
        let view = CounterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        addButtonTarget()
    }
    
    private func configureLayout(){
        view.addSubview(counterView)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            counterView.topAnchor.constraint(equalTo: view.topAnchor),
            counterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            counterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            counterView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addButtonTarget(){
        addIncreaseButtonAction()
        addDecreaseButtonAction()
        addResetButtonAction()
    }
    
    private func updateNumber(flag: Counter){ // 최대/최소값 설정
        switch flag{
        case .down:
            number = number - 1 < minNumber ? number : number - 1
        case .up:
            number = number + 1 > maxNumber ? number : number + 1
        case .reset:
            number = 0
        }
        checkLimitNumber()
    }
    
    private func checkLimitNumber(){ // 버튼 활성화/비활성화 설정
        counterView.decreaseButton.isEnabled = number == minNumber ? false : true
        counterView.increaseButton.isEnabled = number == maxNumber ? false : true
    }
    
    private func showNumber(){
        counterView.numberLabel.text = "\(number)"
    }
    
    private func addIncreaseButtonAction(){
        counterView.increaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
    }

    private func addDecreaseButtonAction(){
        counterView.decreaseButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
    }
    
    private func addResetButtonAction(){
        counterView.resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }
    
    @objc private func increase(){
        updateNumber(flag: .up)
        showNumber()
    }
    
    @objc private func decrease(){
        updateNumber(flag: .down)
        showNumber()
    }
    
    @objc private func reset(){
        updateNumber(flag: .reset)
        showNumber()
    }
    
}

