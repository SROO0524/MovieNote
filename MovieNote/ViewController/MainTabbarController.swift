//
//  MainTabbarController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/21.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        if #available(iOS 13.0, *) {
            UITabBar.appearance().backgroundColor = .systemBackground
        } else {
            UITabBar.appearance().backgroundColor = .white
        }
        tabbarSet()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func tabbarSet() {
            viewControllers = [
                createNavController(for: NoteViewController(), title: NSLocalizedString("나의 영화 노트", comment: ""), image: UIImage(named: "note.text")!),
                createNavController(for: SettingViewController(), title: NSLocalizedString("장르 관리", comment: ""), image: UIImage(named: "gearshape.fill")!)
            ]

    }
}


