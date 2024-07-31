//
//  Categories.swift
//  CategoriesMenu
//
//  Created by Saadet Şimşek on 30/07/2024.
//

import Foundation

enum Categories: String, CaseIterable{
    case post = "Post"
    case answer = "Answer"
    case favorites = "Favorites"
    case articles = "Articles"
    case media = "Media"
    case like = "Likes"
}

extension Categories {
    static var allCategories: [String] {
        Categories.allCases.map { $0.rawValue} // allcases ifasdesinin çağırabilmesi için caseIterable olması şart, enum'un tüm durumlarını (case'lerini) otomatik olarak sıralı döndürmenizi sağlar
    }
}
