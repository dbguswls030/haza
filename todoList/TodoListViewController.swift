//
//  ViewController.swift
//  todoList
//
//  Created by 유현진 on 2021/11/18.
//

import UIKit

class TodoListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    
    @IBAction func inputTask(_ sender: UIButton) {
        guard let task = inputTextField.text, task.isEmpty == false else{
            return
        }
        TodoManager.shared.creatTask(task)
        collectionView.reloadData()
        inputTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(adJustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
            
        NotificationCenter.default.addObserver(self, selector: #selector(adJustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        inputTextField.resignFirstResponder()
    }
}
//
extension TodoListViewController{
    @objc private func adJustInputView(noti: Notification){
        guard let userInfo = noti.userInfo else{
            return
        }
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        if noti.name == UIResponder.keyboardWillShowNotification{
            let adjustmentHeight = keyboardFrame.height - view.safeAreaInsets.bottom
            inputViewBottom.constant = adjustmentHeight
        }else{
            inputViewBottom.constant = 0
        }
    }
}


extension TodoListViewController: UICollectionViewDataSource{
    // MARK: Cell
    func numberOfSections(in collectionView: UICollectionView) -> Int { //섹션의 갯수
        return TodoManager.shared.numOfSection
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //섹션당 아이템 갯수
        if section == 0{
            return TodoManager.shared.todoList.count
        }else{
            return TodoManager.shared.finishedList.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoListCell", for: indexPath) as? TodoListCell else{
            return UICollectionViewCell()
        }
//        var todo = TodoManager.shared.todos[indexPath.item]
        var todo: Todo
        if indexPath.section == 0{
            todo = TodoManager.shared.todoList[indexPath.item]
        }else{
            todo = TodoManager.shared.finishedList[indexPath.item]
        }
        
        
        cell.doneButtonTap = { isDone in
            todo.isDone = isDone
            TodoManager.shared.updateTodo(todo)
            self.collectionView.reloadData()
        }
        cell.deleteButtonTap = {
            TodoManager.shared.deleteTodo(todo)
            self.collectionView.reloadData()
        }
        cell.updateUI(todo)
        return cell
    }
    
    // MARK: Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodoListHeaderView", for: indexPath) as? TodoListHeaderView else{
                return UICollectionReusableView()
            }
            
            guard let section = TodoManager.Section(rawValue: indexPath.section) else {
                return UICollectionReusableView()
            }
            
            header.headerTitle.text = section.title
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension TodoListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
}



class TodoListCell: UICollectionViewCell{
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var doneButtonTap: ((Bool) -> Void)?
    var deleteButtonTap: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //reset()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //reset()
    }
    
    func updateUI(_ todo: Todo){
        taskName.text = todo.title
        checkButton.isSelected = todo.isDone
        deleteButton.isHidden = false
    }
    func strikeThrough(_ show: Bool){
        if show == true{
            let attributeString = NSMutableAttributedString(string: taskName.text!)
            attributeString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
            taskName.attributedText = attributeString
        }else{
            let attributeString = NSMutableAttributedString(string: taskName.text!)

            //attributeString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
            taskName.attributedText = attributeString
        }
    }
    @IBAction func checkTask(_ sender: UIButton) {
        checkButton.isSelected = !checkButton.isSelected
        let isDone = checkButton.isSelected
        strikeThrough(isDone)
        taskName.alpha = isDone ? 0.2 : 1
        doneButtonTap?(isDone)
    }
    
    @IBAction func deleteTask(_ sender: UIButton) {
        deleteButtonTap?()
    }
    
}
class TodoListHeaderView: UICollectionReusableView{
    @IBOutlet weak var headerTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

