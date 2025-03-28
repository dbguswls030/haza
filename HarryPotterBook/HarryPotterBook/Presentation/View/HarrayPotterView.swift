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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var bookInfoStackView: BookInfoStackView = {
        return BookInfoStackView()
    }()
    
    private lazy var didicationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var didicationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dedication"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var didicationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var summaryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
     
    private lazy var summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
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
        addSubview(bookTitleLabel)
        addSubview(seriesCollectionView)
        addSubview(scrollView)
        
        scrollView.addSubview(bookInfoStackView)
        scrollView.addSubview(didicationStackView)
        scrollView.addSubview(summaryStackView)
        
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
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(seriesCollectionView.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        bookInfoStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(25)
            make.width.equalToSuperview().inset(25)
        }
        
        didicationStackView.snp.makeConstraints { make in
            make.top.equalTo(bookInfoStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
        }
        
        [didicationTitleLabel, didicationLabel].forEach{
            didicationStackView.addArrangedSubview($0)
        }
        
        summaryStackView.snp.makeConstraints { make in
            make.top.equalTo(didicationStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(24)
        }
        
        [summaryTitleLabel, summaryLabel].forEach{
            summaryStackView.addArrangedSubview($0)
        }
    }
    
    func setBookTitle(title: String){
        bookTitleLabel.text = title
    }
    
    func setBookInfo(book: Book){
        bookInfoStackView
            .setBookInfo(title: book.title,
                          author: book.author,
                          released: book.releaseDate,
                          pages: "\(book.pages)")
        
        didicationLabel.text = book.dedication
        summaryLabel.text = book.summary
    }
    
    func setBookThumnail(index: Int){
        bookInfoStackView.setBookThumbnail(index: index)
    }
}
