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
        let checkTextExist = mainView.memoTextView.text.components(separatedBy: ["\n", "\t"," "])
        let contentSubtitle = mainView.memoTextView.text.components(separatedBy: "")
        let title = contentTitle[0]
        var subTitle = ""
        var textViewisEmpty = ""
        
        // 텍스트 비어있는지 체크
        for i in 0..<checkTextExist.count {
            if checkTextExist[i] == "\n" || checkTextExist[i] == "\t" || checkTextExist[i] == " " {
                continue
            }
            textViewisEmpty += checkTextExist[i]
        }
        
        guard !textViewisEmpty.isEmpty else {
            showAlert(title: "문자를 입력해주세요")
            return
        }

        // subTitle 쓰기
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
        
        let content = mainView.memoTextView.text
        
        let shareText: String = content!
        var shareObject = [String]()
        
        shareObject.append(shareText)
        
        let activityViewController = UIActivityViewController(activityItems : shareObject, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
