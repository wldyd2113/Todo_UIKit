//
//  AddViewController.swift
//  TodoList
//
//  Created by 차지용 on 5/24/24.
//

import UIKit

protocol AddViewControllerDelegate {
    func saveTodo(todo: Todo)
}

class AddViewController: UIViewController {
    var todos = [Todo]()
    var todoTextInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let todoTextInput = UITextField()
        todoTextInput.borderStyle = .roundedRect
        todoTextInput.placeholder = "입력해주세요"
        todoTextInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todoTextInput)
        
        let addButton = UIButton(type: .custom)
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = .black
        addButton.layer.cornerRadius = 10
        addButton.addAction(UIAction{ [weak self] _ in
            let mainView = MainViewController()
            
        }, for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            todoTextInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoTextInput.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            todoTextInput.widthAnchor.constraint(equalToConstant: 250),
            todoTextInput.heightAnchor.constraint(equalToConstant: 40),
            
            addButton.leadingAnchor.constraint(equalTo: todoTextInput.trailingAnchor, constant: 8),
            addButton.centerYAnchor.constraint(equalTo: todoTextInput.centerYAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
                
    }
    
    func saveTodo(todo: Todo)  {
        if todoTextInput.text!.isEmpty {
            let textSave = Todo(todoText: todoTextInput.text!)
            let mainView = MainViewController()
            self.navigationController?.pushViewController(mainView, animated: true)
        }
    }

}
