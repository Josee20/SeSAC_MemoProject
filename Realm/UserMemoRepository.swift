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
    func addMemo(title: String, date: Date, content: String, favorite:Bool)
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
    
    func addMemo(title: String, date: Date, content: String, favorite: Bool) {
        
        let task = UserMemo(memoTitle: title, memoDate: date, memoContent: content, favorite: favorite)
        
        do {
            try localRealm.write {
                localRealm.add(task)
            }
        } catch {
            print("Add memo error")
        }
    }
    
    func updateFavorite(item: UserMemo) {
        do {
            try localRealm.write {
                item.favorite = !item.favorite
            }
        } catch {
            print("Favorite update error")
        }
    }
    
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
