//
//  SearchAPI.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import UIKit
import Alamofire

class SearchAPI: NetWorkModel {
    func search(query: String) {
//        let URL : String = "\(baseURL)"
        var param: [String:Any] = [:]
        param["query"] = query
//        AF.request(baseURL, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseDecodable { (response: DataResponse<[SearchModel]>) in
//            switch response.
//        }
            
        
    }

}
