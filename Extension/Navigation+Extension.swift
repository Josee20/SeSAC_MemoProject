//
//  Navigation+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/03.
//

import UIKit

extension MemoListViewController {
    
    // MARK: 네비게이션 타이틀
    func setNavigationTitle(numberOfMemo: Int) {
        self.title = "\(numFormat(for: numberOfMemo))개의 메모"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: 네비게이션 백그라운드
    func setNavigationAreaBackgroundColor() {
        let navibarAppearance = UINavigationBarAppearance()

        navibarAppearance.backgroundColor = .systemGray6

        self.navigationItem.scrollEdgeAppearance = navibarAppearance
        self.navigationItem.standardAppearance = navibarAppearance
    }
}

extension WriteViewController {
    func setNavigationAreaBackgroundColor() {
        let navibarAppearance = UINavigationBarAppearance()

        navibarAppearance.backgroundColor = .systemGray6

        self.navigationItem.scrollEdgeAppearance = navibarAppearance
        self.navigationItem.standardAppearance = navibarAppearance
    }
}

