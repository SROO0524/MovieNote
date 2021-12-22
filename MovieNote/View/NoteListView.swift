//
//  NoteListView.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/22.
//

import UIKit

// 나의 영화 기록 장르 리스트 테이블 뷰
class NoteListView: UIView {

    let tableView = UITableView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//        self.snp.makeConstraints { make in
//            make.top.equalTo(superview!.safeAreaLayoutGuide).offset(100)
//            make.leading.trailing.bottom.equalTo(superview!.safeAreaLayoutGuide)
//        }
    }
}
