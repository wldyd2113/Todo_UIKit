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
    var todoTextInput: UITextField?
    var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let todoTextInput = UITextField()
        todoTextInput.borderStyle = .roundedRect
        todoTextInput.placeholder = "입력해주세요"
        todoTextInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todoTextInput)
        
        self.todoTextInput = todoTextInput

        
        let addButton = UIButton(type: .custom)
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = .black
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(saveTodo), for: .touchUpInside)
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
    
    @objc func saveTodo()  {
        guard let todoText = todoTextInput?.text, !todoText.isEmpty else {
            return
        }
        let textSave = Todo(todoText: todoText)
        delegate?.saveTodo(todo: textSave)
        navigationController?.popViewController(animated: true)
    }

}
