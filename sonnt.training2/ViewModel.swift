//
//  ViewModel.swift
//  sonnt.training2
//
//  Created by Nero on 11/13/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel{
    var disposeBag = DisposeBag()
    let baseRequest = BaseRequest()
    let listDangChoVay = BehaviorRelay<[Person]>(value: [])
    let listDangVay = BehaviorRelay<[Person]>(value: [])
    var listObjectDangChoVay = BehaviorRelay<[Person]>(value: [])
    var listObjectDangVay = BehaviorRelay<[Person]>(value: [])
    
    func getDangChoVayData() {
        self.baseRequest.requestUrl(url: "https://mockapi.superoffice.vn/api/baitap2/getDangChoVay",
                                    type: PersonStatus.self) { (array) in
                                        self.listDangChoVay.accept(array.dangChoVayData)
                                        self.listDangChoVay.bind(to: self.listObjectDangChoVay).disposed(by: self.disposeBag)
        }
    }
    
    func getDangVayData() {
        self.baseRequest.requestUrl(url: "https://mockapi.superoffice.vn/api/baitap2/dangVay",
                                    type: PersonStatus.self) { (array) in
                                        self.listDangVay.accept(array.dangVayData)
                                        self.listDangVay.bind(to: self.listObjectDangVay).disposed(by: self.disposeBag)
        }
    }
}
