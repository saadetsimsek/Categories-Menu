//
//  HomeViewController.swift
//  CategoriesMenu
//
//  Created by Saadet Şimşek on 30/07/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let categoriesMenu = CategoriesMenu()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(categoriesMenu)
        
        addConstraits()
    }
    
    private func addConstraits(){
        categoriesMenu.translatesAutoresizingMaskIntoConstraints = false
        print("çel")
       
        NSLayoutConstraint.activate([
            categoriesMenu.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            categoriesMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesMenu.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

}
