//
//  ApiService.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol ApiServices {
    func makeHeroesApi() -> HeroesApi
    func makeHeroStatusApi() -> HeroStatusApi
}


