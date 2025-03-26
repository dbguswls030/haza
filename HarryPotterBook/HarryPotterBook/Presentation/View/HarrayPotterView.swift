//
//  HarrayPotterView.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import UIKit
import SnapKit

final class HarrayPotterView: UIView {
    
    private lazy var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var seriesCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = CGSize(width: 32, height: 32)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(SeriesCollectionViewCell.self, forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
        collectionView.contentMode = .center
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var bookInfoStackView: BookInfoStackView = {
        return BookInfoStackView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        addSubview(bookTitleLabel)
        addSubview(seriesCollectionView)
        addSubview(bookInfoStackView)
        
        bookTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        seriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bookTitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(32)
        }

        bookInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(seriesCollectionView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    func setBookTitle(title: String){
        bookTitleLabel.text = title
    }
}
