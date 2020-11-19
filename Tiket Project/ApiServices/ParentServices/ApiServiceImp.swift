//
//  ApiServiceImp.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation
import RxSwift
import RxCocoa

final class ApiServiceImp: ApiServices {
    
    static var shared = ApiServiceImp()
    lazy var requestObservable = RequestObservable(config: .default)
 
    func makeHeroesApi() -> HeroesApi {
        return HeroesApi()
    }
    
    func makeHeroStatusApi() -> HeroStatusApi {
        return HeroStatusApi()
    }
}
