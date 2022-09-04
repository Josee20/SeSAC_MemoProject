//
//  ToolbarController+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/03.
//

import UIKit

extension MemoListViewController {
    
    // MARK: 툴바
    func setToolbar() {
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.tintColor = .orange
        
        let buttonItem1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let buttonItem2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(writeButtonClicked))
        
        setToolbarItems([buttonItem1, buttonItem2], animated: true)
    }
    
    // MARK: WriteVC로 전환
    @objc func writeButtonClicked() {
        let vc = WriteViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.navigationController?.isToolbarHidden = true
        vc.backButtonTitle = "메모"
        
    }
    
}
