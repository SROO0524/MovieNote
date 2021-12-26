//
//  NewNoteStep2ViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit
import RealmSwift

class NewNoteStep2ViewController: UIViewController, UITextViewDelegate {
    
    let newNoteStep2View = NewNoteStep2View()
    let realm = try! Realm()
    var genre: Genre? = nil
    var selectedMovie: MovieStruct = MovieStruct()
    
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
        newNoteStep2View.confirmBT.addTarget(self, action: #selector(saveNoteBTEvent), for: .touchUpInside)
    }
    
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    
    
    
    @objc func saveNoteBTEvent() {
        let memo = newNoteStep2View.memoTextView.text ?? ""
        
        let duplicated = self.realm.objects(Movie.self).filter("title = %@", selectedMovie.title)
        if duplicated.count > 0 {
            return
        }
        
        let movie = Movie()
        movie.title = selectedMovie.title
        movie.actor = selectedMovie.actor
        movie.director = selectedMovie.director
        movie.releaseDate = selectedMovie.releaseDate
        movie.memo = memo
        movie.gerne = genre
//        genre.id = self.realm.objects(Genre.self).count
        
        try! self.realm.write {
            self.realm.add(movie)
            genre?.movies.append(movie)
        }
        
        let genreDetailVC = GenreDetailViewController()
        navigationController?.popToRootViewController(animated: true)
//        Commmon.popToRoot(param: genreDetailVC, completion: nil)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {

    }
    
    



}
