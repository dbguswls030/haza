//
//  ViewController.swift
//  todoList
//
//  Created by 유현진 on 2021/11/18.
//

import UIKit

class TodoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension TodoListViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int { //섹션의 갯수
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //섹션당 아이템 갯수
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoListCell", for: indexPath) as? TodoListCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodoListHeaderView", for: indexPath) as? TodoListHeaderView else{
                return UICollectionReusableView()
            }
            header.headerTitle.text = "Task"
            return header
            
        default:
            return UICollectionReusableView()
        }
        
    }
}




class TodoListCell: UICollectionViewCell{
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
}
class TodoListHeaderView: UICollectionReusableView{
    @IBOutlet weak var headerTitle: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
}

