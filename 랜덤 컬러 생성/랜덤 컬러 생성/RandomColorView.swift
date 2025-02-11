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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        
        [randomButton, resetButton].forEach{
            stackView.addArrangedSubview($0)
        }
        [stackView, rgbLabel].forEach({ addSubview($0) })

        NSLayoutConstraint.activate([
            rgbLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            rgbLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 60),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -60),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150)
        ])
    }
}
