//
//  NoteDetailViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/24.
//

import UIKit
import RealmSwift

// 영화기록 상세 화면
class NoteDetailViewController: UIViewController {
    
    let likeButton = UIButton()
    let likedImage = UIImage(named: "suit.heart.fill")
    let tableView = UITableView()
    let movieInfoView = MoviewInfoView()
    var movie: Movie? = nil
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navSetLayout()
        view.addSubview(movieInfoView)
        movieInfoView.setLayout(movie: movie!)
    }
    
    func navSetLayout() {
        navigationItem.largeTitleDisplayMode =  .never
        let navTitle = Commmon.formateStringData(string: movie!.title)
        navigationItem.title = navTitle
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backBTEvent)
        )

        tabBarController?.tabBar.isHidden = true 
        
        let rightButton = UIBarButtonItem(customView: likeButton)
        likeButton.setImage(likedImage, for: .normal)
        
        if movie?.like == true {
            likeButton.tintColor = .red
            
        } else {
            likeButton.tintColor = .gray
        
        }
        
        likeButton.addTarget(self, action: #selector(likeBTClicked(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = rightButton
    }
        
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func likeBTClicked(_ sender: UIButton) {
        print("하트클릭")

        if sender.isSelected {
            sender.isSelected = false
            sender.tintColor = .gray
        } else {
            sender.isSelected = true
            sender.tintColor = .red
        }
        
        let movieObject = self.realm.objects(Movie.self).filter("title = %@", movie!.title)

        try! self.realm.write {
            guard let first = movieObject.first else {return}
            first.like = !first.like
            movie?.like = sender.isSelected
        }
        
    }
}
