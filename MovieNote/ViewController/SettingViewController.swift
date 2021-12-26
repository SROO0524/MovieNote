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

// 장르 관리
class SettingViewController: UIViewController {
    
    let tableView = UITableView()
    var genreList : [String] = []
    let cellObservable = PublishSubject<UITableViewCell>()
    let disposeBag = DisposeBag()
    var cellIndexPath : Int?
    var cellStateDictionary : [Int:Bool]?
    let realm = try! Realm()
//    let switchBT = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
//        view.addSubview(switchBT)
//        switchBT.snp.makeConstraints { make in
//            make.center.equalTo(view.safeAreaLayoutGuide)
//        }
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
            print("확인")
            guard let genreText = alert.textFields?.first?.text else { return }
//            self.genreList.append(genreText)
            let content = Content(value:  ["genre": genreText, "switchState": false])
            
            if self.realm.objects(Genre.self).isEmpty == true {

                // settingModel을 생성하고 저장
                let settingModel = Genre()
                settingModel.contents.append(content)

                try! self.realm.write {
                    self.realm.add(settingModel)
                }
            } else {
                try! self.realm.write {
                    let settingModel = self.realm.objects(Genre.self)
                    settingModel.first?.contents.append(content)
                }
            }
            self.genreList.append(genreText)
            
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
        let settingModel = realm.objects(Genre.self)
        return settingModel.first?.contents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreSetTableViewCell", for: indexPath) as! GenreSetTableViewCell
        let settingModel = realm.objects(Genre.self)
        cell.genreLabel.text = settingModel.first?.contents[indexPath.row].name
//        cell.genreLabel.text = genreList[indexPath.row]
        cell.switchBT.isOn = ((settingModel.first?.contents[indexPath.row].state) != nil)
        cellIndexPath = cell.switchBT.tag
        cell.switchBT.addTarget(self, action: #selector(isOn(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func isOn(_ sender: UISwitch) {
        let content = Content(value:  ["genre": "\(genreList[sender.tag])", "switchState": sender.isOn])
//        if realm.objects(SettingModel.self).isEmpty == true {
//
//            // settingModel을 생성하고 저장
//            let settingModel = SettingModel()
//            settingModel.contents.append(content)
//
//            try! realm.write {
//                realm.add(settingModel)
//            }
//        } else {
//            try! realm.write {
//                let settingModel = realm.objects(SettingModel.self)
//                realm.add(settingModel.first?.contents[sender.tag].switchState ?? sender.isOn, update: .modified)
//
//            }
//        }

//        try? realm.write {
//              realm.add(data, update: .modified)
//        }
//
//
//        if let settingModel = realm.objects(Content.self).filter(NSPredicate(format: "genre == %ld", genreList[sender.tag])).first {
//                try? realm.write {
//                    settingModel.genre = genreList[sender.tag]
//                    settingModel.switchState = sender.isOn
//                }
//            } else {
//                print("genreList에 없는 genre 입니다.")
//            }
        let setArray = realm.objects(Genre.self)
        print()
        try! realm.write {
            setArray.first?.contents[sender.tag].name =  content.name
            setArray.first?.contents[sender.tag].state =  content.state
        }
        
    }
    
}
