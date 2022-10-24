//
//  PopUpView.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/04.
//

import UIKit

class PopUpView: BaseView {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "처음 오셨군요!\n환영합니다:)\n\n당신만의 메모를 작성하고\n관리해보세요!"
        view.numberOfLines = 0
        view.backgroundColor = .systemGray6
        view.font = .boldSystemFont(ofSize: 24)
        
        return view
    }()
    
    let checkButton: UIButton = {
        let view = UIButton()
        view.setTitle("확인", for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 25)
        view.setTitleColor(UIColor.systemBackground, for: .normal)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .systemOrange
        return view
    }()
    
    override func configureUI() {
        [backView, welcomeLabel, checkButton].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        backView.snp.makeConstraints {
            $0.leadingMargin.equalTo(40)
            $0.trailingMargin.equalTo(-40)
            $0.centerY.equalTo(UIScreen.main.bounds.height / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 3)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.leadingMargin.equalTo(backView.snp.leading).inset(20)
            $0.trailingMargin.equalTo(backView.snp.trailing).inset(20)
            $0.topMargin.equalTo(backView.snp.top).inset(20)
            $0.bottomMargin.equalTo(checkButton.snp.top).offset(-20)
        }
        
        checkButton.snp.makeConstraints {
            $0.leadingMargin.equalTo(backView.snp.leading).inset(20)
            $0.trailingMargin.equalTo(backView.snp.trailing).inset(20)
            
            $0.bottomMargin.equalTo(backView.snp.bottom).inset(20)
            $0.height.equalTo(58)
        }
        
    }
}
