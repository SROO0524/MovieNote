//
//  Movie.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var title  = ""
    @objc dynamic var watchedAt = Date()
    @objc dynamic var memo = ""
    @objc dynamic var director = ""
    @objc dynamic var actor = ""
    @objc dynamic var releaseDate = ""
    @objc dynamic var link = ""
    @objc dynamic var like = false
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
