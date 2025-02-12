//
//  ViewController.swift
//  메모 앱
//
//  Created by 유현진 on 2/11/25.
//

import UIKit

class ViewController: UIViewController {

    private lazy var memoList: [String] = {
        guard let localData = UserDefaults.standard.array(forKey: "memoList") as? [String] else {
            return []
        }
        return localData
    }()
    {
        didSet{
            UserDefaults.standard.set(memoList, forKey: "memoList")
        }
    }
    
    private lazy var memoView: MemoView = {
        let view = MemoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addMemoButton: UIButton = {
        let button = UIButton(frame: .init(x: 0, y: 0, width: 32, height: 32))
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureTableView()
        configureNavigationBar()
        addMemoButtonAction()
    }
    
    private func configureLayout(){
        view.backgroundColor = .systemBackground
        view.addSubview(memoView)
        
        NSLayoutConstraint.activate([
            memoView.topAnchor.constraint(equalTo: view.topAnchor),
            memoView.leftAnchor.constraint(equalTo: view.leftAnchor),
            memoView.rightAnchor.constraint(equalTo: view.rightAnchor),
            memoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureNavigationBar(){
        self.title = "메모"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addMemoButton)
    }
    
    private func addMemoButtonAction(){
        addMemoButton.addTarget(self, action: #selector(showMakeMemoAlert), for: .touchUpInside)
    }
    
    @objc private func showMakeMemoAlert(){
        let alertVC = UIAlertController(title: "메모 추가", message: "추가할 메모를 작성해 주세요.", preferredStyle: .alert)
        alertVC.addTextField()
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let makeMemoAction = UIAlertAction(title: "추가", style: .default) { [weak self] action in
            if let memo = alertVC.textFields?.first?.text {
                self?.memoList.append(memo)
                DispatchQueue.main.async{
                    self?.memoView.memoTableView.reloadData()
                }
            }
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(makeMemoAction)
        self.present(alertVC, animated: true)
    }
    
    private func configureTableView(){
        memoView.memoTableView.delegate = self
        memoView.memoTableView.dataSource = self
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        cell.setModel(model: memoList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memoList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
