//
//  MemoFolderViewController.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/10/23.
//

import UIKit

class MemoFolderViewController: BaseViewController {
    
    let mainView = MemoFolderView()
    
    var list = [
        FolderList(name: "모든 iCloud", num: 30, image: UIImageView(image: UIImage(systemName: "folder"))),
        FolderList(name: "중요메모", num: 30, image: UIImageView(image: UIImage(systemName: "folder"))),
        FolderList(name: "메모", num: 30, image: UIImageView(image: UIImage(systemName: "folder"))),
        FolderList(name: "최근 삭제된 항목", num: 30, image: UIImageView(image: UIImage(systemName: "trash")))
    ]
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewCell, FolderList>!
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.backgroundColor = .brown
        mainView.collectionView.backgroundColor = .black
        
        cellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.image = self.list.count < (self.list.count - 1) ? UIImage(systemName: "folder") : UIImage(systemName: "trash")
            
            content.text = itemIdentifier.name
            content.secondaryText = "\(itemIdentifier.num)"
//            cell.backgroundColor = .black
            cell.contentConfiguration = content
            
        })
    }
}

extension MemoFolderViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = list[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        
        return cell
    }
}
