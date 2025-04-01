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
    
    private lazy var dedicationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var dedicationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dedication"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var dedicationLabel: UILabel = {
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
    
    private lazy var summaryHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var summaryToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitle("접기", for: .selected)
        button.setTitleColor(.tintColor, for: .normal)
        button.setTitleColor(.tintColor, for: .selected)
        return button
    }()
    
    private lazy var chaptersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var chapterTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Chapters"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var chapterTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
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
        addSubview(bookTitleLabel)
        addSubview(seriesCollectionView)
        addSubview(scrollView)
        
        [bookInfoStackView, dedicationStackView, summaryStackView, chaptersStackView].forEach{
            scrollView.addSubview($0)
        }
        
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
        
        dedicationStackView.snp.makeConstraints { make in
            make.top.equalTo(bookInfoStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
        }
        
        [dedicationTitleLabel, dedicationLabel].forEach{
            dedicationStackView.addArrangedSubview($0)
        }
        
        summaryStackView.snp.makeConstraints { make in
            make.top.equalTo(dedicationStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
        }
        
        [summaryTitleLabel, summaryLabel, summaryHorizontalStackView].forEach{
            summaryStackView.addArrangedSubview($0)
        }
        
        summaryHorizontalStackView.addArrangedSubview(summaryToggleButton)
        
        chaptersStackView.snp.makeConstraints { make in
            make.top.equalTo(summaryStackView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(24)
        }
        
        [chapterTitleLabel, chapterTitleStackView].forEach{
            chaptersStackView.addArrangedSubview($0)
        }
    }
    
    func setBookTitle(title: String){
        bookTitleLabel.text = title
    }
    
    func setBookInfo(book: Book, summaryToggleState: Bool){
        bookInfoStackView
            .setBookInfo(title: book.title,
                          author: book.author,
                          released: book.releaseDate,
                          pages: "\(book.pages)")
        
        dedicationLabel.text = book.dedication
        
        setSummaryHiddenState(isHidden: book.summary.count < 450)
        toggleSummaryState(isSelected: summaryToggleState)
        updateSummary(summary: book.summary)
        setChapters(chapters: book.chapters)
    }
    
    func setBookThumnail(index: Int){
        DispatchQueue.main.async { [weak self] in
            self?.bookInfoStackView.setBookThumbnail(index: index)
        }
        
    }
    
    private func setSummaryHiddenState(isHidden: Bool){
        summaryToggleButton.isHidden = isHidden
    }
    
    func toggleSummaryState(isSelected: Bool){
        summaryToggleButton.isSelected = isSelected
    }
    
    func updateSummary(summary: String){
        if summaryToggleButton.isSelected{
            summaryLabel.text = summary
        }else{
            summaryLabel.text = summary.prefix(450) + "..."
        }
    }
    
    private func setChapters(chapters: [String]){
        removeChapterTitleStackView() // 스택 뷰에 뷰를 삽입하기 전, 스택 뷰 arrangedSubViews 제거
        
        chapters.forEach{
            chapterTitleStackView.addArrangedSubview(makeChapterLabel(title: $0))
        }
    }
    
    // chapterTitleStackView에서 arrangedSubViews를 제거
    private func removeChapterTitleStackView(){
        let arrangedSubViews = chapterTitleStackView.arrangedSubviews
        chapterTitleStackView.arrangedSubviews.forEach(chapterTitleStackView.removeArrangedSubview(_:))
        arrangedSubViews.forEach{$0.removeFromSuperview()}
    }
    
    private func makeChapterLabel(title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }
}
