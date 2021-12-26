//
//  NewNoteStep1ViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit
import RealmSwift

class NewNoteStep1ViewController: UIViewController, UISearchBarDelegate {
    
    let searchHeaderView = SearchHeaderView()
    let tableView = UITableView()
    let searchData = 10
    let searchLabel = UILabel()
    let searchBar = UISearchBar()
    let confirmBT = UIButton()
    let searchViewModel = SearchViewModel()
    var genre: Genre? = nil
    var selectedMovie: MovieStruct? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navSetLayout()
        setLayout()
//        view.addSubview(searchHeaderView)
//        searchHeaderView.setLayout()
        setTableView()
        setBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.title = genre!.name
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
        
        searchBar.delegate = self

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
        confirmBT.setTitleColor(.white, for: .normal)
        confirmBT.backgroundColor = Colors.mainCellColor
        
//        confirmBT.isEnabled = false

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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchViewModel.getSearchData(query: searchText)
    }
    
    func setBinding() {
        searchViewModel.apiResponse.bind(onNext: { [weak self]  in
            self?.tableView.reloadData()
        }).disposed(by: searchViewModel.disposeBag)
    }
    
    
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func confirmClicked() {
        let newNoteStep2VC = NewNoteStep2ViewController()
        newNoteStep2VC.genre = self.genre
        newNoteStep2VC.selectedMovie = self.selectedMovie!
        navigationController?.pushViewController(newNoteStep2VC, animated: true)
    }
}

extension NewNoteStep1ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.getSearchListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let cellData = searchViewModel.getDetailsData(index: indexPath.row)
        cell.movieTitle.font = UIFont.systemFont(ofSize: 15 * view.frame.width / 320)
        cell.releasRateLabel.font = UIFont.systemFont(ofSize: 15 * view.frame.width / 320)
        let titleResult = cellData.title?.replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "<b>", with: "")
        cell.movieTitle.text = titleResult
        cell.releasRateLabel.text = "\(cellData.pubDate ?? "")년 ,\(cellData.userRating ?? "")점"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchResult = searchViewModel.getDetailsData(index: indexPath.row)
        
        var movie = MovieStruct()
        movie.title = searchResult.title ?? ""
        movie.actor = searchResult.actor ?? ""
        movie.director = searchResult.director ?? ""
        movie.releaseDate = searchResult.pubDate ?? ""
        selectedMovie = movie
        
        confirmBT.isEnabled = true
        confirmBT.backgroundColor = Colors.seletedColor
    }
}
