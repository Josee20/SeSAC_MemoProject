//
//  RealmModel.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/01.
//

import Foundation
import RealmSwift

class UserMemo: Object {
    @Persisted var memoTitle: String
    @Persisted var memoDate = Date()
    @Persisted var memoContent: String
    @Persisted var favorite: Bool
    
    @Persisted(primaryKey: true) var objectID: ObjectId
    
    convenience init(memoTitle: String, memoDate: Date, memoContent: String, favorite: Bool) {
        self.init()
        self.memoTitle = memoTitle
        self.memoDate = memoDate
        self.memoContent = memoContent
        self.favorite = false
    }
}