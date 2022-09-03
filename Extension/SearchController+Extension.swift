//
//  SearchController+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/03.
//

import UIKit

extension MemoListViewController {
    
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
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        self.filteredList = self.memoTitleList.filter { $0.lowercased().contains(text) }
        dump(filteredList)
    }
}
