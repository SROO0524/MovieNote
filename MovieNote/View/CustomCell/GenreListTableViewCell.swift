//
//  GenreListTableViewCell.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/22.
//

import UIKit

// 장르 영화 리스트 셀
class GenreListTableViewCell: UITableViewCell {

    let likeImage = UIImageView()
    let viewDatetitle = UILabel()
    let movieTitle = UILabel()
//    var likeCliked = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(likeClicked: Bool) {
        addSubview(likeImage)
        likeImage.image = UIImage(named: "suit.heart.fill")
        likeImage.tintColor = .red
        addSubview(movieTitle)
        movieTitle.text = "영화제목"
        addSubview(viewDatetitle)
        viewDatetitle.text = "2021.12.10 >"
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor

            likeImage.snp.makeConstraints { make in
                make.leading.equalTo(self).offset(20)
                make.bottom.equalTo(self.snp.centerY).inset(5)
            }
            
            movieTitle.snp.makeConstraints { make in
                make.top.equalTo(self.snp.centerY).offset(5)
                make.leading.equalTo(self).offset(20)
                make.bottom.equalTo(self).inset(5)
            }
            
            viewDatetitle.snp.makeConstraints { make in
                make.centerY.equalTo(movieTitle)
                make.trailing.equalTo(self).inset(20)
            }
            
        
    }
}
