//
//  WebviewViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/28.
//

import UIKit
import RealmSwift

// 영화 정보 웹뷰
class WebviewViewController: UIViewController {
    
    let webView = WebView()
    var link = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        setLayout()
        
        let request = URLRequest(url: URL(string: link)!)
        webView.webView.load(request)
    }
    
    func setLayout() {
        webView.snp.makeConstraints({ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        })
    }
}
