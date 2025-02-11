//
//  RandomColorView.swift
//  랜덤 컬러 생성
//
//  Created by 유현진 on 2/11/25.
//

import UIKit

class RandomColorView: UIView {
    lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change Color", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var rgbLabel: UILabel = {
        let label = UILabel()
        label.text = "R: 255, G: 255, B: 255"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        backgroundColor = .systemBackground
        [randomButton, resetButton, rgbLabel].forEach({ addSubview($0) })
        
        NSLayoutConstraint.activate([
            rgbLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            rgbLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            randomButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            randomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
        
        NSLayoutConstraint.activate([
            resetButton.leftAnchor.constraint(equalTo: randomButton.rightAnchor, constant: 15),
            resetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
    }
    
    
}
