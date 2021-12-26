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
    @objc dynamic var gerne: Genre?
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
