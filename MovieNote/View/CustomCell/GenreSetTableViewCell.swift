//
//  GenreSetTableViewCell.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class GenreSetTableViewCell: UITableViewCell {

    let genreLabel = UILabel()
    let switchBT = UISwitch()
    
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
        genreLabel.text = "로맨스"
        genreLabel.font = UIFont.boldSystemFont(ofSize: 25)
        genreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self.snp.leading).offset(20)
        }
        
        contentView.addSubview(switchBT)
        switchBT.snp.makeConstraints { make in
            make.centerY.equalTo(genreLabel)
            make.trailing.equalTo(self.snp.trailing).inset(20)
        }
//        switchBT.addTarget(self, action: #selector(isOn(_:)), for: .touchUpInside)
        switchBT.onTintColor = Colors.seletedColor
    }
    
    @objc func isOn(_ sender: UISwitch) {
        print("장르버튼")
        let settingVC = SettingViewController()
        settingVC.cellObservable.bind(onNext: {model in
            print("\(model.tag)")
        }).disposed(by: settingVC.disposeBag)
    }
}
