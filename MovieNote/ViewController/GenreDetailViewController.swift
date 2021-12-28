//
//  GenreDetailViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/22.
//

import UIKit
import RxCocoa
import RxSwift
import RealmSwift

// 장르별 영화리스트 화면
class GenreDetailViewController: UIViewController {
    
    let headerView = GenreHeaderView()
    let tableView = UITableView()
    let sortBottomUpVC = SortBottomUpViewController()
    let realm = try! Realm()
    var genre: Genre? = nil
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navSetLayout()
        setLayout()
        headerView.sortBT.addTarget(self, action: #selector(sortBTClicked), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sortBottomUpVC.lisetLabelObservable.bind(onNext: { [weak self] model in
            self?.headerView.sortBT.setTitle(model, for: .normal)
        }).disposed(by: sortBottomUpVC.disposeBag)
        
        navigationItem.title = genre!.name
        movies = Array(genre!.movies)
        
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func navSetLayout() {
        navigationController?.navigationBar.prefersLargeTitles = false
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130 * view.frame.width / 320
        
    }
    
    @objc func backBTEvent() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func addNote() {
        print("영화기록추가")
        let newNoteStep1VC = NewNoteStep1ViewController()
        newNoteStep1VC.genre = self.genre
        navigationController?.pushViewController(newNoteStep1VC, animated: false)
    }
    
    @objc func sortBTClicked() {
        print("영화순 정렬")
        sortBottomUpVC.modalPresentationStyle = .overCurrentContext
        present(sortBottomUpVC, animated: true, completion: nil)
    }
}

extension GenreDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "GenreListTableViewCell", for: indexPath) as! GenreListTableViewCell
        listCell.setLayout(likeClicked: movies[indexPath.row].like)
        if movies[indexPath.row].like == false {
            listCell.likeImage.tintColor = .gray
        } else {
            listCell.likeImage.tintColor = .red
        }
        
        let titleResult = Commmon.formateStringData(string: movies[indexPath.row].title)
        listCell.movieTitle.text = titleResult
        let watchAtString = Commmon.getDateString(date: movies[indexPath.row].watchedAt)
        let watchDate = "\(watchAtString) >"
        listCell.viewDatetitle.text = watchDate
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailVC = NoteDetailViewController()
        noteDetailVC.movie = genre?.movies[indexPath.row]
        navigationController?.pushViewController(noteDetailVC, animated: true)
    }
}
