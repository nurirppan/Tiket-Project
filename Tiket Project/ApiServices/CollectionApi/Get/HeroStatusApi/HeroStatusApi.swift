//
//  HeroStatusApi.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation
import RxSwift

class HeroStatusApi {
    
    let httpClient = HTTPClient.init().baseUrlDota
    let urlClient = "/heroStats"
    
    init() { }
    
    func getHeroStatus() throws -> Observable<[HeroStatusResponse]> {
        var request = URLRequest(url: URL(string:"\(httpClient)\(urlClient)")!)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return ApiServiceImp.shared.requestObservable.callAPI(request: request)
    }
}
