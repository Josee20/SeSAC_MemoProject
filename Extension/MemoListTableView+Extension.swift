//
//  MemoListTableView+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/04.
//

import UIKit

extension MemoListViewController {
    
    // MARK: 스와이프시 이미지 정해주는 함수
    func swipeImage(indexPathRow: Int, indexPathSection: Int) -> String {
        var image = ""
        
        if isFiltering {
            image = searchTasks[indexPathRow].favorite == true ? "pin.slash.fill" : "pin.fill"
            return image
        } else {
            image = indexPathSection == 0 ? "pin.slash.fill" : "pin.fill"
            return image
        }
    }
}

// MARK: 테이블뷰 CornerRadius
extension UIView {
    
    func makeRoundCorner(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
