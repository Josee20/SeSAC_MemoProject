//
//  WriteView.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/01.
//

import UIKit

class WriteView: BaseView {
    
    let memoTextView: UITextView = {
        let view = UITextView()
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    override func configureUI() {
        self.addSubview(memoTextView)
    }
    
    override func setConstraints() {
        
        memoTextView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.trailingMargin.bottomMargin.equalTo(-20)
            $0.leadingMargin.equalTo(20)
        }
    }
}


