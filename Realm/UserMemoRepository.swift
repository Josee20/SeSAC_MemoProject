//
//  UserMemoRepository.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/01.
//

import Foundation

import RealmSwift


protocol UserMemoRepositoryType {
    func fetch() -> Results<UserMemo>
    func addMemo(title: String, date: Date, subTitle: String, content: String, favorite: Bool)
    func updateMemo(objectID: ObjectId, title: String, date: Date, subTitle: String, content: String)
    func updateFavorite(item: UserMemo)
    func delete(item: UserMemo?)
    func fetchFixFilter() -> Results<UserMemo>
    func fetchUnfixFilter() -> Results<UserMemo>
    
}

class UserMemoRepository: UserMemoRepositoryType {

    let localRealm = try! Realm()
    
    func fetch() -> Results<UserMemo> {
        return localRealm.objects(UserMemo.self).sorted(byKeyPath: "memoDate", ascending: false)
    }
    
    // 메모추가
    func addMemo(title: String, date: Date, subTitle: String, content: String, favorite: Bool) {
        
        let task = UserMemo(memoTitle: title, memoDate: date, memoSubtitle: subTitle, memoContent: content, favorite: favorite)
        
        do {
            try localRealm.write {
                localRealm.add(task)
            }
        } catch {
            print("Add memo error")
        }
    }
    
    // 테이블뷰셀 누르면 메모 업데이트
    func updateMemo(objectID: ObjectId, title: String, date: Date, subTitle: String, content: String) {
        
        do {
            try localRealm.write {
                localRealm.create(UserMemo.self, value: ["objectID": objectID, "memoTitle": title, "memoDate":date, "memoSubtitle":subTitle, "memoContent":content], update: .modified)
            }
        } catch {
            print("update error")
        }
    }
    
    // Fix Unfix
    func updateFavorite(item: UserMemo) {
        do {
            try localRealm.write {
                item.favorite = !item.favorite
            }
        } catch {
            print("Favorite update error")
        }
    }
    
    // 셀 삭제
    func delete(item: UserMemo?) {
        do {
            try localRealm.write {
                localRealm.delete(item!)
            }
        } catch {
            print("delete error")
        }
    }
    
    func fetchFixFilter() -> Results<UserMemo> {
        return localRealm.objects(UserMemo.self).filter("favorite == true").sorted(byKeyPath: "memoDate", ascending: false)
    }
    
    func fetchUnfixFilter() -> Results<UserMemo> {
        return localRealm.objects(UserMemo.self).filter("favorite == false").sorted(byKeyPath: "memoDate", ascending: false)
    }
    
}
