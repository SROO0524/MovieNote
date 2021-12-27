//
//  SearchViewModel.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/26.
//

import Foundation
import RxCocoa
import RxSwift

class SearchViewModel {
    
    var searchModel : SearchModel?
    var searchList = [SearchModel.Items]()
    var totalElements : Int?
    let apiResponse = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    
    
    func getSearchData(query: String) {
        let searchAPI = SearchAPI()
        searchAPI.search(query: query) { [weak self] (isSuccess, model) in
            if isSuccess {
                self?.searchList = []
                self?.searchModel = model as? SearchModel
                self?.searchList.append(contentsOf: self?.searchModel?.items ?? [])
                self?.totalElements = self?.searchModel?.total
                self?.apiResponse.onNext(())
            } else {
                
            }
        }
    }
    
    func getSearchListCount() -> Int {
        searchList.count
    }
    
    func getDetailsData(index: Int) -> SearchModel.Items {
        if searchList.count > index {
            return searchList[index]
        } else {
            return SearchModel.Items(JSON: ["":""])!
        }
    }
}

