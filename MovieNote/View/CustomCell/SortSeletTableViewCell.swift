//
//  SortSeletTableViewCell.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/23.
//

import UIKit

class SortSeletTableViewCell: UITableViewCell {
    
    let sortTitle = UILabel()
    let checkImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                checkImage.isHidden = false
            } else {
                checkImage.isHidden = true
            }
        }
    }
    
    func setLayout() {
        backgroundColor = Colors.mainCellColor
        addSubview(sortTitle)
        sortTitle.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self)
        }
        
        addSubview(checkImage)
        checkImage.image = UIImage(named: "checkmark")
        checkImage.snp.makeConstraints { make in
            make.centerY.equalTo(sortTitle)
            make.trailing.equalTo(self).inset(10)
        }
    }

}
