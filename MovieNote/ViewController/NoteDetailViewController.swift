//
//  NoteDetailViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/24.
//

import UIKit

// 영화기록 상세 화면
class NoteDetailViewController: UIViewController {
    
    let likeButton = UIButton()
    let unlikedImage = UIImage(named: "suit.heart")
    let likedImage = UIImage(named: "suit.heart.fill")
    let tableView = UITableView()
    let movieInfoView = MoviewInfoView()
    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navSetLayout()
//        setTableView()
        view.addSubview(movieInfoView)
        movieInfoView.setLayout(movie: movie!)
    }
    
    func navSetLayout() {
        navigationItem.largeTitleDisplayMode =  .never
        navigationItem.title = movie!.title
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
        likeButton.tintColor = .gray
        likeButton.addTarget(self, action: #selector(likeBTClicked(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = rightButton
    }
    
//    func setTableView() {
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: "MovieInfoTableViewCell")
//        tableView.register(ViewDateTableViewCell.self, forCellReuseIdentifier: "ViewDateTableViewCell")
//        tableView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//
//        tableView.separatorInset.left = 0
//        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 150
//    }
    
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
    }
}

//extension NoteDetailViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        var cell = UITableViewCell()
//
//        if indexPath.row == 0 {
//            let movieInfCcell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoTableViewCell", for: indexPath) as! MovieInfoTableViewCell
////            movieInfCcell.setLayout()
//            movieInfCcell.snp.makeConstraints { make in
//                make.height.equalTo(150)
//                make.width.equalTo(self)
//            }
//            cell = movieInfCcell
//        } else if indexPath.row == 1 {
//            let viewDateCell = tableView.dequeueReusableCell(withIdentifier: "ViewDateTableViewCell") as! ViewDateTableViewCell
//            cell = viewDateCell
//        }
//
//        return cell
//
//    }
//
//
//}
