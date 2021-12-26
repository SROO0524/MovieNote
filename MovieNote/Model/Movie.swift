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
    @objc dynamic var gerne: Genre?
    
    override static func primaryKey() -> String? {
        return "title"
    }
}


// 영화 제목 / 영화본 날짜 / 메모 / 감독 / 출현진 / 개봉년도
