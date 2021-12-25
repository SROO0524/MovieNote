//
//  SearchTableViewCell.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    let movieTitle = UILabel()
    let releasRateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        addSubview(movieTitle)
        movieTitle.text = "영화이름"
        movieTitle.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(10)
            make.bottom.equalTo(self.snp.centerY)
        }
        
        addSubview(releasRateLabel)
        releasRateLabel.text = "개봉년도, 평점"
        releasRateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.centerY)
            make.leading.equalTo(movieTitle)
        }
    }
}
