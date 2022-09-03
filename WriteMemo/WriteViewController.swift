//
//  WriteViewController.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/01.
//

import Foundation
import UIKit
import RealmSwift

class WriteViewController: BaseViewController {
    
    let mainView = WriteView()
    
    let repository = UserMemoRepository()
    
    override func loadView() {
        self.view = mainView
        
        let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonClicked))
        navigationItem.rightBarButtonItems = [doneButton, shareButton]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .lightGray
    }
    
    override func configure() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isToolbarHidden = false
    }
    
    // MARK: 완료버튼클릭
    @objc func doneButtonClicked() {
        let content = mainView.memoTextView.text.components(separatedBy: "\n")
        let title = content[0]
        var subTitle = ""
        
        for i in 1..<content.count {
            if content[i] == "\n" {
                continue
            } else {
                subTitle = content[i]
            }
        }
    
        repository.addMemo(title: title, date: Date(), content: subTitle, favorite: false)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: 공유버튼클릭
    @objc func shareButtonClicked() {
        
    }
    
}
