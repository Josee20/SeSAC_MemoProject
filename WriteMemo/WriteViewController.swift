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
    var backButtonTitle = ""
    var objectID: ObjectId?
    
    override func loadView() {
        self.view = mainView
        
        let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonClicked))
        navigationItem.rightBarButtonItems = [doneButton, shareButton]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "\(backButtonTitle)"
        self.navigationController?.navigationBar.tintColor = .systemOrange
        
        setNavigationAreaBackgroundColor()
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
        let contentTitle = mainView.memoTextView.text.components(separatedBy: "\n")
        let contentSubtitle = mainView.memoTextView.text.components(separatedBy: "")
        let title = contentTitle[0]
        var subTitle = ""
        
        for i in 1..<contentTitle.count {
            subTitle += contentTitle[i]
        }
    
        // MARK: 메모버튼클릭 OR 테이블뷰셀 클릭해서 수정
        if backButtonTitle == "메모" {
            repository.addMemo(title: title, date: Date(), subTitle: subTitle, content: contentSubtitle[0], favorite: false)
        } else if backButtonTitle == "검색" {
            repository.updateMemo(objectID: objectID!, title: title, date: Date(), subTitle: subTitle, content: contentSubtitle[0])
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: 공유버튼클릭
    @objc func shareButtonClicked() {

    }
    
}
