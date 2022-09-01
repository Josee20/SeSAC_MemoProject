//
//  BaseViewController.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/08/31.
//

import Foundation
import UIKit

import SnapKit

class BaseViewController: UIViewController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configure()
        setConstraints()
    }
    
    func configure() { }
    func setConstraints() { }
    func showAlert(title: String, button: String = "확인") {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

    

