//
//  PopUpViewController.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/04.
//

import Foundation
import UIKit

class PopUpViewController: BaseViewController {
    
    let mainView = PopUpView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemBackground.withAlphaComponent(0.8)
    }
    
    override func configure() {
        mainView.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
    }
    
    @objc func checkButtonClicked() {
        UserDefaults.standard.set(true, forKey: "first")
        dismiss(animated: true)
        
    }
    
}
