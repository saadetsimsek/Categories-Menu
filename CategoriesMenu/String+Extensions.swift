//
//  String+Extensions.swift
//  CategoriesMenu
//
//  Created by Saadet Şimşek on 31/07/2024.
//

import Foundation
import UIKit

extension String {
    func defineWidth() -> CGFloat {
        let font = UIFont(name: "Arial Bold", size: 18)
        let attributes = [NSAttributedString.Key.font: font as Any]
        return self.size(withAttributes: attributes).width
        
    }
}
