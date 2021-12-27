//
//  DataEmptyView.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/27.
//

import UIKit

// 테이블뷰 데이터값이 없을때
class DataEmptyView: UIView {

    let emptyTitle = UILabel()
    
    func setLayout() {
        self.snp.makeConstraints { make in
            make.edges.equalTo(superview!.safeAreaLayoutGuide)
        }
        
        emptyTitle.snp.makeConstraints { make in
            make.center.equalTo(self.center)
        }
    }
}
