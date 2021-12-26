//
//  NewNoteStep1ViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class NewNoteStep1ViewController: UIViewController {
    
    let searchHeaderView = SearchHeaderView()
    let tableView = UITableView()
    let searchData = 10
    let searchLabel = UILabel()
    let searchBar = UISearchBar()
    let confirmBT = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navSetLayout()
        setLayout()
//        view.addSubview(searchHeaderView)
//        searchHeaderView.setLayout()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.title = Commmon.navTitleName
    }
    
    func navSetLayout() {
        navigationItem.largeTitleDisplayMode =  .never
        
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backBTEvent)
        )
        tabBarController?.tabBar.isHidden = true
    }
    
    func setLayout() {
        view.addSubview(searchLabel)
        searchLabel.text = "영화 이름이 무엇인가요?"
        searchLabel.font = UIFont.boldSystemFont(ofSize: 16 * view.frame.height / 568)
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
        }

        view.addSubview(searchBar)
        searchBar.layer.cornerRadius = 2
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.layer.borderColor = Colors.mainCellColor?.cgColor
        tableView.layer.borderWidth = 1
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.separatorInset.left = 0
        tableView.rowHeight = 60 * view.frame.height / 568
        
        view.addSubview(confirmBT)
        confirmBT.setTitle("다음", for: .normal)
        confirmBT.backgroundColor = Colors.mainCellColor
        confirmBT.setTitleColor(.white, for: .normal)
        confirmBT.layer.cornerRadius = 5
        confirmBT.clipsToBounds = true
        confirmBT.addTarget(self, action: #selector(confirmClicked), for: .touchUpInside)
        confirmBT.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50 * view.frame.height / 568)
        }
    }
    
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func confirmClicked() {
        let newNoteStep2VC = NewNoteStep2ViewController()
        navigationController?.pushViewController(newNoteStep2VC, animated: true)
    }
}

extension NewNoteStep1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.movieTitle.font = UIFont.systemFont(ofSize: 15 * view.frame.width / 320)
        cell.releasRateLabel.font = UIFont.systemFont(ofSize: 15 * view.frame.width / 320)
        return cell
    }
    
    
}
