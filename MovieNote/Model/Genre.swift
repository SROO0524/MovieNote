//
//  SettingModel.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import RealmSwift

class Genre: Object {
    var contents = List<Content>()
}

class Content: Object {
    @objc dynamic var name  = UUID().uuidString
    @objc dynamic var state : Bool = false
    
    override static func primaryKey() -> String? {
        
        return "genre"
      }
    
    
}
