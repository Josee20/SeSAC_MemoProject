//
//  MemoListTableViewCell.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/08/31.
//

import UIKit

class MemoListTableViewCell: BaseTableViewCell {
    
    let memoTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    let memoDateLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = Constants.Color.subTitleColor
        return view
    }()
    
    let memoContentLabel: UILabel = {
       let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = Constants.Color.subTitleColor
        return view
    }()
    
    override func configure() {
        self.addSubview(memoTitleLabel)
        self.addSubview(memoDateLabel)
        self.addSubview(memoContentLabel)
    }
    
    override func setConstraints() {
        let spacing = 8
        
        memoTitleLabel.snp.makeConstraints {
            $0.topMargin.leadingMargin.equalTo(spacing)
            $0.trailingMargin.equalTo(-spacing)
            $0.bottomMargin.equalTo(memoDateLabel.snp.top).offset(-spacing)
        }
        
        memoDateLabel.snp.makeConstraints {
            $0.leadingMargin.equalTo(spacing)
            $0.bottomMargin.equalTo(-spacing)
            $0.trailingMargin.equalTo(memoContentLabel.snp.leading).offset(-spacing * 2)
        }
        
        memoContentLabel.snp.makeConstraints {
            $0.topMargin.equalTo(memoTitleLabel.snp.bottom).offset(spacing)
            $0.bottomMargin.equalTo(-spacing)
            
        }

    }

}


