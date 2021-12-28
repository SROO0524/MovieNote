//
//  ViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/21.
//

import UIKit
import RxCocoa
import RxSwift
import RealmSwift

// 장르 관리 화면
class SettingViewController: UIViewController {
    
    let tableView = UITableView()
    let cellObservable = PublishSubject<UITableViewCell>()
    let disposeBag = DisposeBag()
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("😀realmURL\(Realm.Configuration.defaultConfiguration.fileURL)")
        setTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "plus"),
            style: .plain,
            target: self,
            action: #selector(addGenre)
        )
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.register(GenreSetTableViewCell.self, forCellReuseIdentifier: "GenreSetTableViewCell")
        tableView.separatorInset.left = 0
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 80 * view.frame.width / 320
    }
    
    @objc func addGenre() {
        print("영화 장르 추가 하기")
        let alert = UIAlertController(title: "", message: "추가할 장르를 입력해주세요.", preferredStyle: UIAlertController.Style.alert)

        // 메시지 창 컨트롤러에 들어갈 버튼 액션 객체 생성
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { action in
            guard let name = alert.textFields?.first?.text else { return }
            let duplicated = self.realm.objects(Genre.self).filter("name == %@", name)
            if duplicated.count > 0 {
                return
            }
            
            let genre = Genre()
            genre.name = name
            genre.id = self.realm.objects(Genre.self).count
            
            try! self.realm.write {
                self.realm.add(genre)
            }
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel) { action in
            self.dismiss(animated: true, completion: nil)
        }

        //메시지 창 컨트롤러에 버튼 액션을 추가
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.addTextField()

        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
    }
}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let genres = realm.objects(Genre.self)
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreSetTableViewCell", for: indexPath) as! GenreSetTableViewCell
        let genres = realm.objects(Genre.self)
        cell.genreLabel.text = genres[indexPath.row].name
        cell.switchBT.isOn = genres[indexPath.row].state
        cell.switchBT.tag = genres[indexPath.row].id
        cell.switchBT.addTarget(self, action: #selector(isOn(_:)), for: .touchUpInside)
        return cell
    }
    
    // 스위치 on/off 버튼
    @objc func isOn(_ sender: UISwitch) {
        let index = sender.tag
        let genre = realm.objects(Genre.self).filter("id = %@", index)
        print("index: \(index)")
        try! realm.write {
            guard let first = genre.first else {return}
            first.state = !first.state
        }
    }
}
