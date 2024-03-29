//
//  RealmModel.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/01.
//

import Foundation
import RealmSwift

class UserMemo: Object {
    @Persisted var title: String
    @Persisted var memoDate = Date()
    @Persisted var memoSubtitle: String
    @Persisted var memoContent: String
    @Persisted var favorite: Bool
    @Persisted var memoDescription: String
    @Persisted var count: Double
    
    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(memoTitle: String, memoDate: Date, memoSubtitle: String, memoContent: String, favorite: Bool) {
        self.init()
        self.title = memoTitle
        self.memoDate = memoDate
        self.memoSubtitle = memoSubtitle
        self.memoContent = memoContent
        self.favorite = false
    }
}
