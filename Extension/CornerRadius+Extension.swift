//
//  CornerRadius+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/01.
//

import UIKit

extension UIView {
    
    func makeRoundCorner(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
}
