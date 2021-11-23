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
class TodoListCell: UICollectionViewCell{
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    
}
class TodoListHeaderView: UICollectionReusableView{
    @IBOutlet weak var headerTitle: UILabel!
}

