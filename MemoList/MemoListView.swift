//
//  MemoListView.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/08/31.
//

import UIKit

class MemoListView: BaseView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.clipsToBounds = true
        view.rowHeight = 60
        return view
    }()
    
    override func configureUI() {
        self.addSubview(tableView)
    }
    
    override func setConstraints() {
        
        tableView.snp.makeConstraints {
            $0.leadingMargin.topMargin.equalTo(20)
            $0.trailingMargin.bottomMargin.equalTo(-20)
        }
        
    }
}
