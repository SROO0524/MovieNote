//
//  SearchAPI.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import UIKit
import Alamofire
import ObjectMapper

class SearchAPI: NetWorkModel {
    func search(query: String, completion: @escaping (Bool, Mappable?) -> Void) {
        var param: [String:Any] = [:]
        param["query"] = query
        AF.request(baseURL, method: .get, parameters:param, encoding: URLEncoding.default, headers: headers).responseString { response in
            switch response.result {
            case .success:
                print("getResult : ",String(decoding: response.data!, as: UTF8.self))
                let certResultDataModel = Mapper<SearchModel>().map(JSONString: String(decoding: response.data!, as: UTF8.self))
                print(certResultDataModel as Any)
                completion(true,certResultDataModel)
                print("성공")
            case .failure:
                completion(false,nil)
                print("실패", response.error as Any)
            }
        }
    }
}
