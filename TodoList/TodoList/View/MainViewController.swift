//
//  MainViewController.swift
//  TodoList
//
//  Created by 차지용 on 5/24/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource{
    let todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.title = "TodoList"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //navigation 제목 글자 색 지정
        appearence.backgroundColor = .black
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        //Add버튼
        let addButon = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToAddPage))
        self.navigationItem.rightBarButtonItem = addButon
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todoList = todos[indexPath.row]
        return cell
    }
    
    // AddViewController로 이동
    @objc func navigateToAddPage() {
        let addView = AddViewController()
        self.navigationController?.pushViewController(addView, animated: true)
    }

}
