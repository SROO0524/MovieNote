//
//  File.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import UIKit

class Commmon : NSObject {
    static var navTitleName = ""
    static var movieTitle = ""
    static var releaseDate = ""
    static var actor = ""
    static var director = ""
    static var genre : Genre?
    
    // 루트뷰 이동
    static func popToRoot(param: UINavigationController! ,completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        param.popToRootViewController(animated: true)
        CATransaction.commit()
    }
}
