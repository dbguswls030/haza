//
//  CounterView.swift
//  카운터 앱
//
//  Created by 유현진 on 2/11/25.
//

import UIKit

class CounterView: UIView {

    lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("더하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("비활성화", for: .disabled)
        return button
    }()

    lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("빼기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("비활성화", for: .disabled)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
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
    
        [increaseButton, decreaseButton, resetButton].forEach({
            stackView.addArrangedSubview($0)
        })
        
        [stackView, numberLabel].forEach({addSubview($0)})
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
}
