//
//  MemoListViewController.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/08/31.
//

import UIKit

class MemoListViewController: BaseViewController {
    
    let mainView = MemoListView()
    
    let headerList = ["고정된 메모", "메모"]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
    }
    
    override func configure() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(MemoListTableViewCell.self, forCellReuseIdentifier: MemoListTableViewCell.reuseIdentifier)
        
        setNavigationTitle(numberOfMemo: 777)
        setSearchController()
        setNavigationAreaBackgroundColor()
        setToolbar()
    }
    
    func setToolbar() {
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.tintColor = .orange
        
        let buttonItem1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let buttonItem2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(writeButtonClicked))
        
        setToolbarItems([buttonItem1, buttonItem2], animated: true)
    }
    
    func setNavigationTitle(numberOfMemo: Int) {
        self.title = "\(numberOfMemo)개의 메모"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    func setSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "검색"
    }
    
    func setNavigationAreaBackgroundColor() {
        let navibarAppearance = UINavigationBarAppearance()

        navibarAppearance.backgroundColor = .systemGray6

        self.navigationItem.scrollEdgeAppearance = navibarAppearance
        self.navigationItem.standardAppearance = navibarAppearance
    }
    
    @objc func writeButtonClicked() {
        print("a")
    }
}

extension MemoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader")
            
        header?.textLabel?.text = headerList[section]
        header?.textLabel?.font = .systemFont(ofSize: 20)
        header?.textLabel?.textAlignment = .left
        
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoListTableViewCell.reuseIdentifier, for: indexPath) as? MemoListTableViewCell else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            cell.makeRoundCorner(cornerRadius: Constants.Design.CornerRadius, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        } else if indexPath.row == 4 {
            cell.makeRoundCorner(cornerRadius: Constants.Design.CornerRadius, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        }
        
        cell.memoTitleLabel.text = "제목"
        cell.memoDateLabel.text = "9월 1일"
        cell.memoContentLabel.text = "즐거운 코딩~"
        cell.backgroundColor = .systemGray6
        
        return cell
    }
}






