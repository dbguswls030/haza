//
//  MemoTableViewCell.swift
//  메모 앱
//
//  Created by 유현진 on 2/12/25.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    static let identifier: String = "MemoCell"
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            contentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            contentLabel.topAnchor.constraint(equalTo: topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setModel(model: String){
        contentLabel.text = model
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = nil
    }
}
