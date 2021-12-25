//
//  SortBottomUpViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/23.
//

import UIKit
import RxSwift
import RxCocoa

class SortBottomUpViewController: UIViewController {
    
    let bottomView = UIView()
    let tableView = UITableView()
    let sortTitleLabel = UILabel()
    let listLabel = ["기록 생성 순", "영화 본 날짜순", "개봉년도 순"]
    let lisetLabelObservable = PublishSubject<String>()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setTableView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: false, completion: nil)
    }
    
    func setLayout() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(bottomView)
        bottomView.backgroundColor = Colors.mainCellColor
        bottomView.layer.cornerRadius = 10
        bottomView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner , .layerMaxXMinYCorner)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
            make.height.equalTo(view.frame.height / 4)
        }
        
        bottomView.addSubview(sortTitleLabel)
        sortTitleLabel.text = "정렬 방식"
        sortTitleLabel.font = UIFont.boldSystemFont(ofSize: 20 * view.frame.width / 320)
        sortTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomView).offset(20)
            make.leading.equalTo(bottomView).offset(20)
        }
        
        bottomView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(sortTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(sortTitleLabel)
            make.trailing.equalTo(bottomView).inset(20)
            make.bottom.equalTo(bottomView).inset(10)
        }
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SortSeletTableViewCell.self, forCellReuseIdentifier: "SortSeletTableViewCell")
        tableView.backgroundColor = Colors.mainCellColor
        tableView.separatorInset.left = 0
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 30 * view.frame.width / 320
    }
}

extension SortBottomUpViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "SortSeletTableViewCell", for: indexPath) as!
            SortSeletTableViewCell
        listCell.sortTitle.text = listLabel[indexPath.row]
        listCell.sortTitle.font = UIFont.systemFont(ofSize: 15 * view.frame.width / 320)
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lisetLabelObservable.onNext("\(listLabel[indexPath.row]) ⌄")
    }
}
