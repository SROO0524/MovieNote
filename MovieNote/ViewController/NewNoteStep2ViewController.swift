//
//  NewNoteStep2ViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit

class NewNoteStep2ViewController: UIViewController {
    
    let newNoteStep2View = NewNoteStep2View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navSetLayout()
        setLayout()
    }
    
    func navSetLayout() {
        navigationItem.largeTitleDisplayMode =  .never
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backBTEvent)
        )
        tabBarController?.tabBar.isHidden = true
    }
    
    func setLayout() {
        view.addSubview(newNoteStep2View)
        newNoteStep2View.setLayout()
    }
    
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    



}
