//
//  File.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import UIKit

class Commmon : NSObject {
    
    // 루트뷰 이동
    static func popToRoot(param: UINavigationController! ,completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        param.popToRootViewController(animated: true)
        CATransaction.commit()
    }
    
    // DateFormatter
    static func getDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: date)
        return dateFormatter.string(from: date)
    }
    
    // 영화 이름 스트링 값 치환
    static func formateStringData(string: String) -> String {
        let titleResult = string.replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "<b>", with: "")
        return titleResult
    }
    

}
