//
//  SearchHeaderView.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class SearchHeaderView: UIView {

    let searchLabel = UILabel()
    let searchBar = UISearchBar()
    let customView = UIView()
    
    func setLayout() {
        
        
        self.snp.makeConstraints { make in
            make.top.equalTo(superview!.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(superview!.safeAreaLayoutGuide)
        }
        
        addSubview(searchLabel)
        searchLabel.text = "영화 이름이 무엇인가요?"
        searchLabel.font = UIFont.boldSystemFont(ofSize: 16 * self.frame.height / 568)
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.leading.equalTo(self).offset(10)
        }
        
        inputView?.addSubview(searchBar)
        searchBar.layer.cornerRadius = 2
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).offset(20)
        }
        
        searchBar.placeholder = "영화 검색"
    }
    
}
