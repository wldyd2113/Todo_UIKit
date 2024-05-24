//
//  MainViewController.swift
//  TodoList
//
//  Created by 차지용 on 5/24/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, AddViewControllerDelegate{
    func saveTodo(todo: Todo)  {
        let textSave = todo.todoText
        print(textSave)
    }
    
    
    var todos = [Todo]()
    var sectionTitle:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.title = "TodoList"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //navigation 제목 글자 색 지정
        appearence.backgroundColor = .black
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        let titleField = UITextField()
        titleField.borderStyle = .roundedRect
        titleField.placeholder = "제목을 입력해주세요"
        titleField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleField)
        
        //Add버튼
        let addButon = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToAddPage))
        self.navigationItem.rightBarButtonItem = addButon
        
        let titleAddBtn = UIButton(type: .custom)
        titleAddBtn.setTitle("Add", for: .normal)
        titleAddBtn.backgroundColor = .black
        titleAddBtn.layer.cornerRadius = 10
        titleAddBtn.translatesAutoresizingMaskIntoConstraints = false
        titleField.addTarget(self, action: #selector(titleFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(titleAddBtn)
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // 왼쪽 여백 추가
            titleField.widthAnchor.constraint(equalToConstant: 250),
            titleField.heightAnchor.constraint(equalToConstant: 40),

            titleAddBtn.leadingAnchor.constraint(equalTo: titleField.trailingAnchor, constant: 20), // titleField의 오른쪽에 위치하도록 설정
            titleAddBtn.centerYAnchor.constraint(equalTo: titleField.centerYAnchor), // titleField와 수직 중앙에 위치하도록 설정
            titleAddBtn.widthAnchor.constraint(equalToConstant: 40),
            titleAddBtn.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todoList = todos[indexPath.row]
        cell.textLabel?.text = todoList.todoText
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle
    }

    // AddViewController로 이동
    @objc func navigateToAddPage() {
        let addView = AddViewController()
        addView.delegate = self
        self.navigationController?.pushViewController(addView, animated: true)
    }
    
    //titleField에서 입력한값을 저장하는 함수
    @objc func titleFieldDidChange(_ titleField: UITextField) {
        if let text = titleField.text {
            sectionTitle = text
        }
    }
    


}
