//
//  MainViewController.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/24/25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private lazy var harrayPotterView: HarrayPotterView = {
        return HarrayPotterView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureSeriesCollectionView()
        configureSeriesCollectionView()
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
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
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
