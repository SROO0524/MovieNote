//
//  GenreHeaderView.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/22.
//

import UIKit

class GenreHeaderView: UIView {

    let sortBT = UIButton()
    
    func setLayout() {
        addSubview(sortBT)
        sortBT.setTitle("영화본 날짜 순 ⌄", for: .normal)
        sortBT.setTitleColor(.black, for: .normal)
        
        snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(superview!.safeAreaLayoutGuide)
            make.height.equalTo(30)
        }
        
        sortBT.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
    }
}
