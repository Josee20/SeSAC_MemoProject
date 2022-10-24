//
//  MemoFolderView.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/10/23.
//

import UIKit

class MemoFolderView: BaseView {
    
    public let collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    
    override func configureUI() {
        self.addSubview(collectionView)
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.top.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    
}
