//
//  SearchController+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/03.
//

import UIKit
import RealmSwift

struct AllInfo {
    var title: String?
    var Date: Date?
    var subTitle: String?
}

extension MemoListViewController {
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHaveText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHaveText
    }
    
    func setSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension MemoListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputText = searchController.searchBar.text?.lowercased() else { return }
        self.searchTasks = self.tasks.filter("memoTitle CONTAINS[c] %@ OR memoContent CONTAINS[c] %@", inputText, inputText)
        self.mainView.tableView.reloadData()
    }
}

