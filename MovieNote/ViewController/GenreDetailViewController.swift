//
//  GenreDetailViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/22.
//

import UIKit

// 장르별 영화리스트 화면
class GenreDetailViewController: UIViewController {
    
    let headerView = GenreHeaderView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navSetLayout()
        setLayout()
    }
    
    func navSetLayout() {
        navigationItem.largeTitleDisplayMode =  .never
        navigationItem.title = "로맨스"
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backBTEvent)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "plus"),
            style: .plain,
            target: self,
            action: #selector(addNote)
        )
        tabBarController?.tabBar.isHidden = true
    }
    
    func setLayout() {
        view.addSubview(headerView)
        headerView.setLayout()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GenreListTableViewCell.self, forCellReuseIdentifier: "GenreListTableViewCell")
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.separatorInset.left = 0
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.estimatedRowHeight = 80
    }
    
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func addNote() {
        print("영화기록추가")
    }

}

extension GenreDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "GenreListTableViewCell", for: indexPath) as! GenreListTableViewCell
        
        return listCell
    }
    
    
}
