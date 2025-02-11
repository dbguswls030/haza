//
//  ViewController.swift
//  랜덤 컬러 생성
//
//  Created by 유현진 on 2/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var randomColorView: RandomColorView = {
        let view = RandomColorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        addButtonAction()
    }
    
    private func configureLayout(){
        view.backgroundColor = .systemBackground
        view.addSubview(randomColorView)
        NSLayoutConstraint.activate([
            randomColorView.topAnchor.constraint(equalTo: view.topAnchor),
            randomColorView.leftAnchor.constraint(equalTo: view.leftAnchor),
            randomColorView.rightAnchor.constraint(equalTo: view.rightAnchor),
            randomColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addButtonAction(){
        addRandomButtonAction()
        addResetButtonAction()
    }
    
    private func addRandomButtonAction(){
        randomColorView.randomButton.addTarget(self, action: #selector(changeBackgroundColor), for: .touchUpInside)
    }
    
    private func addResetButtonAction(){
        randomColorView.resetButton.addTarget(self, action: #selector(resetBackgroundColor), for: .touchUpInside)
    }
    
    @objc private func changeBackgroundColor(){
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)

        randomColorView.backgroundColor = randomColor
        randomColorView.rgbLabel.text = "R: \(Int(randomRed*255)), G: \(Int(randomGreen*255)), B: \(Int(randomBlue*255))"
    }
    
    @objc private func resetBackgroundColor(){
        randomColorView.backgroundColor = .white
        randomColorView.rgbLabel.text = "R: 255, G: 255, B: 255"
    }
}

