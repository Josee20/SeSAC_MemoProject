//
//  MemoListViewController.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/08/31.
//

import UIKit
import RealmSwift

class MemoListViewController: BaseViewController {
    
    let repository = UserMemoRepository()
    
    let mainView = MemoListView()
    
    var headerList = ["고정된 메모", "메모"]
    
    var memoTitleList = [String]()
    var filteredList = [String]()
    
    var tasks: Results<UserMemo>! {
        didSet {
            fixedTasks = repository.fetchFixFilter()
            unFixedTasks = repository.fetchUnfixFilter()
            mainView.tableView.reloadData()
        }
    }
    
    var fixedTasks: Results<UserMemo>!
    var unFixedTasks: Results<UserMemo>!

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mainView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
        
        print(repository.localRealm.configuration.fileURL!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tasks = repository.fetch()
        
        for i in 0..<tasks.count {
            memoTitleList.append(tasks[i].memoTitle)
        }
        
        print(memoTitleList)
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
    
    func fetchRealm() {
        tasks = repository.fetch()
    }
}

extension MemoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tasks.isEmpty {
            return 0
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return  fixedTasks.count
        } else {
            return unFixedTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader")
            
        header?.textLabel?.text = headerList[section]
        header?.textLabel?.font = .systemFont(ofSize: 20)
        
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoListTableViewCell.reuseIdentifier, for: indexPath) as? MemoListTableViewCell else { return UITableViewCell() }
        
        // MARK: CornerRadius
        if indexPath.row == 0 {
            cell.makeRoundCorner(cornerRadius: Constants.Design.CornerRadius, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        } else if indexPath.row == tasks.count - 1 {
            cell.makeRoundCorner(cornerRadius: Constants.Design.CornerRadius, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        }
        
        if indexPath.section == 0 {
            cell.memoTitleLabel.text = fixedTasks[indexPath.row].memoTitle
            cell.memoDateLabel.text = DateFormatChange.shared.todayDateFormat.string(from: fixedTasks[indexPath.row].memoDate)
            cell.memoContentLabel.text = fixedTasks[indexPath.row].memoContent
        } else {
            cell.memoTitleLabel.text = unFixedTasks[indexPath.row].memoTitle
            cell.memoDateLabel.text = DateFormatChange.shared.todayDateFormat.string(from: unFixedTasks[indexPath.row].memoDate)
            cell.memoContentLabel.text = unFixedTasks[indexPath.row].memoContent
        }
        
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    // MARK: Swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
           
            guard self.fixedTasks.count > 5 else {
                self.showAlert(title: "5개를 초과해 등록할 수 없습니다.")
                return
            }
            
            if indexPath.section == 0 {
                self.repository.updateFavorite(item: self.fixedTasks[indexPath.row])
            } else {
                self.repository.updateFavorite(item: self.unFixedTasks[indexPath.row])
            }
            
            self.fetchRealm()
        }
        
//        print("favorite: \(tasks[indexPath.row].favorite)")
        
        let image = indexPath.section == 0 ? "pin.slash.fill" : "pin.fill"
        
        favorite.image = UIImage(systemName: image)
        favorite.backgroundColor = .systemOrange
        
        return UISwipeActionsConfiguration(actions: [favorite])
    }
    
    // MARK: 셀 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if indexPath.section == 0 {
                repository.delete(item: fixedTasks?[indexPath.row])
            } else {
                repository.delete(item: unFixedTasks?[indexPath.row])
            }
        }
        
        self.fetchRealm()
    }
    
}






