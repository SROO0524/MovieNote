//
//  NoteViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/21.
//

import UIKit

// 나의 영화 기록
class NoteViewController: UIViewController {

//    let noteTableView = NoteListView()
    let exampleGenre = ["로맨스","액션","스릴러"]
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
        setLayout()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
        tabBarController?.tabBar.isHidden = false
    }
    
    func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.register(NoteListTableViewCell.self, forCellReuseIdentifier: "noteListTableViewCell")
        tableView.separatorInset.left = 0
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 80
    }
}


extension NoteViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleGenre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listCell = tableView.dequeueReusableCell(withIdentifier: "noteListTableViewCell", for: indexPath) as! NoteListTableViewCell
        listCell.genreLabel.text = exampleGenre[indexPath.row]
        
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genreDetailVC = GenreDetailViewController()
        navigationController?.pushViewController(genreDetailVC, animated: false)
    }
    
    
}
