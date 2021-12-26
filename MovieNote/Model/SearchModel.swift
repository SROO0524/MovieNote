//
//  SearchModel.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import UIKit
import ObjectMapper

class SearchModel: Mappable {

    var lastBuildDate: String?
    var total: Int?
    var start: Int?
    var display: Int?
    var items: [Items]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lastBuildDate       <- map["lastBuildDate"]
        total               <- map["total"]
        start               <- map["start"]
        display             <- map["display"]
        items               <- map["items"]
    }
    
    class Items : Mappable {
        
        var title: String?
        var link: String?
        var image : String?
        var subtitle : String?
        var pubDate : String?
        var director : String?
        var actor : String?
        var userRating : String?
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            title           <- map["title"]
            link            <- map["link"]
            image           <- map["image"]
            subtitle        <- map["subtitle"]
            pubDate         <- map["pubDate"]
            director        <- map["director"]
            actor           <- map["actor"]
            userRating      <- map["userRating"]
        }
    }
}
