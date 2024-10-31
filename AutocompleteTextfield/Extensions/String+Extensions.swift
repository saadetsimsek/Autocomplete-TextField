//
//  String+Extensions.swift
//  AutocompleteTextfield
//
//  Created by Saadet Şimşek on 31/10/2024.
//

import UIKit

extension String {
    func attributedStringColor(_ targetWords: [String], color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        for targetWord in targetWords {
            let range = (self as NSString).range(of: targetWord)
            if range.location != NSNotFound {
                attributedString.addAttribute(.foregroundColor, value: color, range: range)
            }
        }
        
        return attributedString
    }
}
