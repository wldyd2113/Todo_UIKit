//
//  AddViewController.swift
//  TodoList
//
//  Created by 차지용 on 5/24/24.
//

import UIKit

class AddViewController: UIViewController {

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

}
