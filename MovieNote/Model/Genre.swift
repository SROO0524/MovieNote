//
//  SettingModel.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import RealmSwift

class Genre: Object {
    @objc dynamic var id  = 0
    @objc dynamic var name  = ""
    @objc dynamic var state : Bool = false
    let movies = List<Movie>()
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
