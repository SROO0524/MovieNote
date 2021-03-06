//
//  NoteViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/21.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

// 나의 영화 장르 메인화면
class NoteViewController: UIViewController {
    
    let tableView = UITableView()
    var gernes : [Genre] = []
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        setTableview()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        tabBarController?.tabBar.isHidden = false
        gernes = Array(realm.objects(Genre.self).filter("state = %@", 1))
        tableView.reloadData()
    }
    
    func setTableview() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.register(NoteListTableViewCell.self, forCellReuseIdentifier: "noteListTableViewCell")
        tableView.separatorInset.left = 0
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 80 * view.frame.width / 320
    }
    
    @objc func pushDetailVC() {
        let genreDetailVC = GenreDetailViewController()
        navigationController?.pushViewController(genreDetailVC, animated: true)
    }
}


extension NoteViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gernes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "noteListTableViewCell", for: indexPath) as! NoteListTableViewCell
        let genre = gernes[indexPath.row]
        listCell.genreLabel.text = genre.name
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = gernes[indexPath.row]
        let genreDetailVC = GenreDetailViewController()
        genreDetailVC.genre = genre
        navigationController?.pushViewController(genreDetailVC, animated: false)
    }
    
    
}
