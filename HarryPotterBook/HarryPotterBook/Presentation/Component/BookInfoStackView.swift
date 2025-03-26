//
//  BookInfoView.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/26/25.
//

import UIKit
import SnapKit

final class BookInfoStackView: UIStackView {
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .harrypotter1
        return imageView
    }()
    
    private lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Harry Potter and the Philosopher’s Stone"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var detailInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var authorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var authorTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Author"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "J. K. Rowling"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var releasedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var releasedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Released"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var releasedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "June 26, 1997"
        return label
    }()
    
    private lazy var pagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var pagesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pages"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var pagesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "223"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttributes()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setAttributes(){
        axis = .horizontal
        distribution = .fillProportionally
        spacing = 15
    }
    
    private func configureLayout(){
        
        [authorTitleLabel, authorLabel].forEach{
            authorStackView.addArrangedSubview($0)
        }
        
        [releasedTitleLabel, releasedLabel].forEach{
            releasedStackView.addArrangedSubview($0)
        }
        
        [pagesTitleLabel, pagesLabel].forEach{
            pagesStackView.addArrangedSubview($0)
        }
        
        [infoTitleLabel, authorStackView, releasedStackView, pagesStackView].forEach{
            detailInfoStackView.addArrangedSubview($0)
        }
        
        [thumbnailImageView, detailInfoStackView].forEach{
            addArrangedSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1.5)
        }
    }
    
    func setBookInfo(title: String, author: String, released: String, pages: String){
        infoTitleLabel.text = title
        authorLabel.text = author
        releasedLabel.text = released
        pagesLabel.text = pages
    }
    
    func setBookThumbnail(index: Int){
        switch index{
        case 1: thumbnailImageView.image = .harrypotter1
        case 2: thumbnailImageView.image = .harrypotter2
        case 3: thumbnailImageView.image = .harrypotter3
        case 4: thumbnailImageView.image = .harrypotter4
        case 5: thumbnailImageView.image = .harrypotter5
        case 6: thumbnailImageView.image = .harrypotter6
        case 7: thumbnailImageView.image = .harrypotter7
        default: break
        }
    }
}
