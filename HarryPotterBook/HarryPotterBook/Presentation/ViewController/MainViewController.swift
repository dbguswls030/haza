//
//  MainViewController.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/24/25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel = MainViewModel()
    
    private lazy var harrayPotterView: HarrayPotterView = {
        return HarrayPotterView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureSeriesCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bindViewModel()
        viewModel.loadBooks()
    }
    
    private func configureLayout(){
        view.backgroundColor = .systemBackground
        view.addSubview(harrayPotterView)
        
        harrayPotterView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureSeriesCollectionView(){
        harrayPotterView.seriesCollectionView.delegate = self
        harrayPotterView.seriesCollectionView.dataSource = self
    }
    
    private func setBookTitle(index: Int){
        harrayPotterView.setBookTitle(title: viewModel.getBookTitle(index: index))
    }
    
    private func setBookInfo(index: Int){
        harrayPotterView.setBookInfo(book: viewModel.getBook(index: index))
        harrayPotterView.setBookThumnail(index: index)
    }
    
    private func bindViewModel(){
        viewModel.successedLoad = { [weak self] in
            DispatchQueue.main.async{
                self?.setBookTitle(index: 2)
                self?.setBookInfo(index: 2)
            }
        }
        
        viewModel.jsonParseErrorListenr = { [weak self] error in
            self?.showAlert(message: error)
        }
    }
    
    private func showAlert(message: String){
        let alertVC = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alertVC, animated: true)
    }
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setSeriesNumber(number: indexPath.item+1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth: Int = 32
        let totalCellWidth = cellWidth * collectionView.numberOfItems(inSection: section)
        let defaultCellSpacing = 10
        let totalSpacing = (collectionView.numberOfItems(inSection: section) - 1) * defaultCellSpacing
        let horizontalInset = max((collectionView.frame.width - CGFloat(totalCellWidth) - CGFloat(totalSpacing))  / 2, 0) // 음수 방지
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
}
