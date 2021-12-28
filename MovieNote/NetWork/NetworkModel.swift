//
//  NetworkModel.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/21.
//

import Foundation
import UIKit
import Alamofire

class NetWorkModel {

    let baseURL = "https://openapi.naver.com/v1/search/movie.json"
    var headers : HTTPHeaders = [
        "X-Naver-Client-Id": "CL8FxWqGckBm4isPxeSE",
        "X-Naver-Client-Secret": "9_Q_ftV4oi"
    ]
}


