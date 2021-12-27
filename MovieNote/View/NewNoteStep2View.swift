//
//  NewNoteStep2View.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class NewNoteStep2View: UIView {
    
    let viewDate = UILabel()
    let viewDateTextView = UITextView()
    
    let memoLabel = UILabel()
    let memoTextView = UITextView()
    
    let confirmBT = UIButton()
    
    func setLayout() {
        backgroundColor = .white
        self.snp.makeConstraints { make in
            make.edges.equalTo(superview!.safeAreaLayoutGuide)
        }
        
        addSubview(viewDate)
        viewDate.text = "영화 본 날짜"
        viewDate.font = UIFont.boldSystemFont(ofSize: 16 * superview!.frame.height / 568)
        viewDate.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20 * superview!.frame.height / 568)
            make.leading.equalTo(self).offset(10)
        }
        
        addSubview(viewDateTextView)
        viewDateTextView.font = UIFont.systemFont(ofSize: 15 * superview!.frame.height / 568)
        viewDateTextView.layer.cornerRadius = 5
        viewDateTextView.clipsToBounds = true
        viewDateTextView.layer.borderWidth = 1
        viewDateTextView.layer.borderColor = Colors.mainCellColor?.cgColor
        viewDateTextView.snp.makeConstraints { make in
            make.top.equalTo(viewDate)
            make.leading.equalTo(viewDate.snp.trailing).offset(10)
            make.trailing.equalTo(self).inset(10)
            make.centerY.equalTo(viewDate.snp.centerY)
            make.height.equalTo(40)
        }
        
        addSubview(memoLabel)
        memoLabel.text = "메모"
        memoLabel.font = UIFont.boldSystemFont(ofSize: 16 * superview!.frame.height / 568)
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(viewDateTextView.snp.bottom).offset(20 * superview!.frame.height / 568)
            make.leading.equalTo(viewDate)
        }
        
        addSubview(memoTextView)
        memoTextView.font = UIFont.systemFont(ofSize: 15 * superview!.frame.height / 568)
        memoTextView.layer.cornerRadius = 5
        memoTextView.clipsToBounds = true
        memoTextView.layer.borderWidth = 1
        memoTextView.layer.borderColor = Colors.mainCellColor?.cgColor
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(20 * superview!.frame.height / 568)
            make.leading.equalTo(memoLabel.snp.leading)
            make.trailing.equalTo(self).inset(10)
        }
        
        addSubview(confirmBT)
        confirmBT.setTitle("다음", for: .normal)
        confirmBT.backgroundColor = Colors.seletedColor
        confirmBT.setTitleColor(.white, for: .normal)
        confirmBT.layer.cornerRadius = 5
        confirmBT.clipsToBounds = true
        confirmBT.snp.makeConstraints { make in
            make.top.equalTo(memoTextView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(memoTextView)
            make.height.equalTo(50 * superview!.frame.height / 568)
            make.bottom.equalTo(self.snp.bottom).inset(10)
        }

    }

}
