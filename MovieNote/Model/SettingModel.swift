//
//  SettingModel.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import RealmSwift

class SettingModel: Object {
    var contents = List<Content>()
}

class Content: Object {
    @objc dynamic var genre : String  = ""
    @objc dynamic var switchState : Bool = false
}
