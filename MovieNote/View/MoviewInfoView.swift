//
//  MoviewInfoView.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class MoviewInfoView: UIView {
    
    
    let containerView = UIView()
    let yearDateLabel = UILabel()
    let directorLabel = UILabel()
    let actorLabel = UILabel()
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    let memoTitle = UILabel()
    let memoTextView = UITextView()
    
    func setLayout(movie: Movie) {
        
        self.snp.makeConstraints { make in
            make.top.equalTo(superview!.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(superview!.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(superview!.safeAreaLayoutGuide).inset(100)
        }
        
        addSubview(containerView)
        containerView.backgroundColor = Colors.mainCellColor
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(100 * superview!.frame.height / 568)
        }
        
        containerView.addSubview(directorLabel)
        directorLabel.text = "2. 감독 : \(movie.director)"
        directorLabel.font = UIFont.systemFont(ofSize: 15 * superview!.frame.height / 568)
        directorLabel.snp.makeConstraints { make in
            make.center.equalTo(containerView)
        }
        
        containerView.addSubview(yearDateLabel)
        yearDateLabel.text = "1. 개봉년도 : \(movie.releaseDate)"
        yearDateLabel.font = UIFont.systemFont(ofSize: 15 * superview!.frame.height / 568)
        yearDateLabel.snp.makeConstraints { make in
            make.centerX.equalTo(containerView)
            make.bottom.equalTo(directorLabel.snp.bottom).inset(30)
        }
        
        containerView.addSubview(actorLabel)
        actorLabel.text = "3. 출현진: \(movie.actor)"
        actorLabel.font = UIFont.systemFont(ofSize: 15 * superview!.frame.height / 568)
        actorLabel.snp.makeConstraints { make in
            make.top.equalTo(directorLabel.snp.bottom).offset(10)
            make.centerX.equalTo(containerView)
            
        }
        
        addSubview(titleLabel)
        titleLabel.text = "영화 본 날짜"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15 * superview!.frame.height / 568)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(10 * superview!.frame.height / 568)
            make.leading.equalTo(self).offset(10)
        }
        
        
        addSubview(dateLabel)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: movie.watchedAt)
        dateLabel.text = dateString
        dateLabel.font = UIFont.systemFont(ofSize: 10 * superview!.frame.height / 568)
        dateLabel.textColor = .gray
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(10)
            make.centerY.equalTo(titleLabel)
        }

        addSubview(memoTitle)
        memoTitle.text = "메모"
        memoTitle.font = UIFont.boldSystemFont(ofSize: 15 * superview!.frame.height / 568)
        memoTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10 * superview!.frame.height / 568)
            make.leading.equalTo(titleLabel)
        }

        addSubview(memoTextView)
        memoTextView.layer.cornerRadius = 10
        memoTextView.clipsToBounds = true
        memoTextView.layer.borderColor = Colors.mainCellColor?.cgColor
        memoTextView.layer.borderWidth = 1
        memoTextView.isEditable = true
        memoTextView.text = movie.memo
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(memoTitle.snp.bottom).offset(10 * superview!.frame.height / 568)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(80 * superview!.frame.height / 568)
        }
    }
}
