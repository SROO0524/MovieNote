//
//  NewNoteStep2View.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

// 영화 기록 커스텀 뷰
class NewNoteStep2View: UIView {
    
    let viewDate = UILabel()
    let viewDateBT = UIButton()
    
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
            make.width.equalTo(superview!.frame.width / 3)
        }
        
        addSubview(viewDateBT)
        viewDateBT.titleLabel?.font = UIFont.systemFont(ofSize: 10 * superview!.frame.height / 568)
        viewDateBT.layer.cornerRadius = 5
        viewDateBT.clipsToBounds = true
        viewDateBT.layer.borderWidth = 1
        viewDateBT.layer.borderColor = Colors.mainCellColor?.cgColor
        viewDateBT.setTitle("날짜를 선택해주세요", for: .normal)
        viewDateBT.setTitleColor(.black, for: .normal)
        viewDateBT.backgroundColor = .white
        viewDateBT.snp.makeConstraints { make in
            make.leading.equalTo(viewDate.snp.trailing).offset(10)
            make.trailing.equalTo(self).inset(10)
            make.centerY.equalTo(viewDate.snp.centerY)
            make.height.equalTo(40)
        }
        
        
        addSubview(memoLabel)
        memoLabel.text = "메모"
        memoLabel.font = UIFont.boldSystemFont(ofSize: 16 * superview!.frame.height / 568)
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(viewDateBT.snp.bottom).offset(20 * superview!.frame.height / 568)
            make.leading.equalTo(viewDate)
        }
        
        addSubview(memoTextView)
        memoTextView.font = UIFont.systemFont(ofSize: 12 * superview!.frame.height / 568)
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
        confirmBT.backgroundColor = Colors.mainCellColor
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
