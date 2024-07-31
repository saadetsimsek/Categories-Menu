//
//  CategoriesMenu.swift
//  CategoriesMenu
//
//  Created by Saadet Şimşek on 30/07/2024.
//

import UIKit


final class CategoriesMenu: UIView {
    
    
    private var widthConstraint = NSLayoutConstraint()
    private var leadingConstraint = NSLayoutConstraint()
    
    private let collectionView : UICollectionView = {
        let categoriesLayout = UICollectionViewFlowLayout()
        categoriesLayout.minimumInteritemSpacing = 5
        categoriesLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: categoriesLayout)
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let lineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(collectionView)
        addSubview(lineView)
        collectionView.delegate = self
        collectionView.dataSource = self
        AddConstraits()
        lineViewConstraits()
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func AddConstraits(){
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

    }
    
    private func lineViewConstraits(){
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .blue
        
        let inititalWidth = Categories.allCases[0].rawValue.defineWidth()
        widthConstraint = lineView.widthAnchor.constraint(equalToConstant: inititalWidth + 20)
        leadingConstraint = lineView.leadingAnchor.constraint(equalTo: leadingAnchor)
        widthConstraint.isActive = true
        leadingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    private func animateLineView(originX: CGFloat, width: CGFloat){
        widthConstraint.constant = width
        leadingConstraint.constant = originX
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    
    
}
// MARK: -CollectionView Delegate

extension CategoriesMenu: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.allCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else{
            return UICollectionViewCell()
        }
        let name = Categories.allCases[indexPath.row].rawValue
        cell.configure(with: name)
        cell.isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
        let name = Categories.allCases[indexPath.row].rawValue
        print(name)
        
        UIView.animate(withDuration: 0.4) {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
        
        guard let attributes = collectionView.layoutAttributesForItem(at: indexPath) else {return}
        let cellRect = attributes.frame
        let cellFrameInSuperView = collectionView.convert(cellRect, to: collectionView.superview)
        
        animateLineView(originX: cellFrameInSuperView.origin.x, width: cellFrameInSuperView.width)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { // labelların boyutunun label büyüklüğüne göre ayarlanması
        
        let width = Categories.allCases[indexPath.row].rawValue.defineWidth()
        return CGSize(width: width + 20,
                      height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("! !")
     /*   CategoriesCollectionViewCell.performWithoutAnimation { // slow geçiş
            cell.layoutIfNeeded()
        }
      */
    }
    
}
        

