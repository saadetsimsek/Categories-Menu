//
//  CategoriesCollectionViewCell.swift
//  CategoriesMenu
//
//  Created by Saadet Şimşek on 30/07/2024.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            categoryNameLabel.textColor = isSelected ? .black : .gray
            
        }
    }
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        contentView.addSubview(categoryNameLabel)
        addConstraits()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraits(){
        NSLayoutConstraint.activate([
            categoryNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    func configure(with name: String) {
        categoryNameLabel.text = name
        
    }
    
}
