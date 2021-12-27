//
//  WebView.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/28.
//

import UIKit
import WebKit

class WebView: UIView {

   var webView = WKWebView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(webView)
        setWebView()
        setLayout()
    }
    
    func setWebView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webConfiguration.dataDetectorTypes = [.all]
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.allowsBackForwardNavigationGestures = false
    }
    
    func setLayout() {
        webView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
