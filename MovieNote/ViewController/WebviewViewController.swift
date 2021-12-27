//
//  WebviewViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/28.
//

import UIKit
import RealmSwift

class WebviewViewController: UIViewController {
    
    let webView = WebView()
    var movie: Movie? = nil
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        setLayout()

        let request = URLRequest(url: URL(string: movie?.link ?? "")!)
        webView.webView.load(request)
    }
    
    func setLayout() {
        webView.snp.makeConstraints({ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        })
    }
}
