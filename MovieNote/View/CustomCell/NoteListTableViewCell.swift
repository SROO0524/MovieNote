//
//  NoteListTableViewCell.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/22.
//

import UIKit
import SnapKit


// 나의 영화 기록 장르 리스트 셀
class NoteListTableViewCell: UITableViewCell {

    let genreLabel = UILabel()
    let arrowLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLayout() {
        self.backgroundColor = Colors.mainCellColor
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 10
        self.clipsToBounds = true
        
        addSubview(genreLabel)
        genreLabel.font = UIFont.boldSystemFont(ofSize: 25)
        genreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        
        addSubview(arrowLabel)
        arrowLabel.font = UIFont.boldSystemFont(ofSize: 25)
        arrowLabel.text = "〉"
        arrowLabel.snp.makeConstraints { make in
            make.centerY.equalTo(genreLabel)
            make.trailing.equalTo(self.snp.trailing).inset(20)
        }
    }

}
