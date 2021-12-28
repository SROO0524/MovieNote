//
//  NewNoteStep2ViewController.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/25.
//

import UIKit
import RealmSwift

// 영화 본 날짜/ 메모 기록 화면
class NewNoteStep2ViewController: UIViewController, UITextViewDelegate {
    
    let newNoteStep2View = NewNoteStep2View()
    let realm = try! Realm()
    var genre: Genre? = nil
    var selectedMovie: MovieStruct = MovieStruct()
    var isInMemo = false
    var isDateSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navSetLayout()
        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        newNoteStep2View.memoTextView.delegate = self
        newNoteStep2View.setLayout()
        newNoteStep2View.confirmBT.addTarget(self, action: #selector(saveNoteBTEvent), for: .touchUpInside)
        newNoteStep2View.viewDateBT.addTarget(self, action: #selector(dateSetBTEvent(_:)), for: .touchUpInside)

    }
    
    @objc func backBTEvent() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func dateSetBTEvent(_ sender: UIButton) {
        let dateChooserAlert = UIAlertController(title: "날짜 선택", message: nil, preferredStyle: .actionSheet)
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        dateChooserAlert.view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(dateChooserAlert.view)
            make.bottom.equalTo(dateChooserAlert.view).inset(30)
            make.height.equalTo(350)
        }
        
        dateChooserAlert.addAction(UIAlertAction(title: "선택완료", style: .default, handler: { (action) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            let date = formatter.string(from: datePicker.date)
            sender.setTitle(date, for: .normal)
            self.isDateSelected = true
            self.confirmBTActive()
        }))
        self.present(dateChooserAlert, animated: true, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespaces) != "" {
            isInMemo = true
        } else {
            isInMemo = false
        }
        confirmBTActive()
    }
    
    @objc func saveNoteBTEvent() {
        
        let memo = newNoteStep2View.memoTextView.text ?? ""
        let watchedAt = newNoteStep2View.viewDateBT.titleLabel?.text
        
        let duplicated = self.realm.objects(Movie.self).filter("title = %@", selectedMovie.title)
        if duplicated.count > 0 {
            let toast = UIAlertController(title: "", message: "이미 등록된 영화 입니다.", preferredStyle: .alert)
            toast.addAction(UIAlertAction(title: "확인", style: .default, handler: { (Action) -> Void in
                let settingsURL = NSURL(string: UIApplication.openSettingsURLString)! as URL
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }))
            
            toast.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            toast.modalPresentationStyle = .overFullScreen
            self.present(toast, animated: true, completion: nil)
            return
            
        }
        
        let movie = Movie()
        movie.title = selectedMovie.title
        movie.actor = selectedMovie.actor
        movie.director = selectedMovie.director
        movie.releaseDate = selectedMovie.releaseDate
        movie.memo = memo
        movie.watchedAt = stringToDate(string: watchedAt ?? "")
        movie.link = selectedMovie.link
        
        try! self.realm.write {
            self.realm.add(movie)
            genre?.movies.append(movie)
        }
        
        self.dismiss(animated: true) {
            self.popToFirstVC()
        }
    }
    
    // 완료 버튼 클릭시 화면 전환
    func popToFirstVC() {
        if let firstViewController = self.navigationController?.viewControllers[1] {
            self.navigationController?.popToViewController(firstViewController, animated: true)
        }
    }
    
    func stringToDate(string: String) -> Date{
        let dateString = string

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.timeZone = NSTimeZone(name: "KST") as TimeZone?

        let date:Date = dateFormatter.date(from: dateString)!
        return date
    }
    
    func confirmBTActive() {
        if isInMemo == true && isDateSelected == true {
            newNoteStep2View.confirmBT.isEnabled = true
            newNoteStep2View.confirmBT.backgroundColor = Colors.seletedColor
        } else {
            newNoteStep2View.confirmBT.isEnabled = false
            newNoteStep2View.confirmBT.backgroundColor = Colors.mainCellColor
        }
    }
}
