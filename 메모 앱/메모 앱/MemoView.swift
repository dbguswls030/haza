//
//  MemoView.swift
//  메모 앱
//
//  Created by 유현진 on 2/11/25.
//

import UIKit

class MemoView: UIView {

    lazy var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 40
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        addSubview(memoTableView)
        
        NSLayoutConstraint.activate([
            memoTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            memoTableView.leftAnchor.constraint(equalTo: leftAnchor),
            memoTableView.rightAnchor.constraint(equalTo: rightAnchor),
            memoTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

