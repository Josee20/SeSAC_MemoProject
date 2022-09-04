//
//  textColor+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/03.
//

import UIKit

extension UILabel {
    func setHighlighted(_ text: String, with search: String) {
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSString(string: text).range(of: search, options: .caseInsensitive)
        let highlightColor = traitCollection.userInterfaceStyle == .light ? UIColor.systemYellow : UIColor.systemOrange
        let highlightedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: highlightColor]
        attributedText.addAttributes(highlightedAttributes, range: range)
        self.attributedText = attributedText
    }
}
