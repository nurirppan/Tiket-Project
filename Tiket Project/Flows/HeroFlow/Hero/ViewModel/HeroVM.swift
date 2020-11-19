//
//  HeroVM.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//
import Foundation
import RxSwift
import RxCocoa





class HeroVM {
    let heroStatusApi = ApiServiceImp.shared.makeHeroStatusApi()
    
    var relayHeroModels = PublishSubject<[HeroesModels]>()
    var relayHeroStatusModels = PublishSubject<[String]>()
    var relayHeroStatusResponse = BehaviorRelay<[HeroStatusResponse]>(value: [])
    
    var tempHeroModels: [HeroesModels] = []
    var tempHeroStatusString: [String] = []
    var tempHeroStatusResponse: [HeroStatusResponse] = []
    
    let vc = UIViewController()
    let dispose = DisposeBag()
    
    
    init() { }
    
    struct Output {
        let outHeroStatusResponse: Driver<[HeroStatusResponse]>
    }
    
    func transform() -> HeroVM.Output {
        return Output(
            outHeroStatusResponse: self.relayHeroStatusResponse.asDriver()
        )
    }
    
    func fetchHeroStatusApi() {
        Loading.defaultShow()
        do {
            try self.heroStatusApi.getHeroStatus().subscribe(onNext: { result in
                self.tempHeroStatusResponse.append(contentsOf: result)
                self.relayHeroStatusResponse.accept(result)
                for model in result {
                    // MARK :- APPEND HERO MODELS
                    self.tempHeroModels.append(
                        HeroesModels(
                            id: model.id,
                            nameOfHero: model.localizedName,
                            imageOfHero: URL(string: "\(HTTPClient.init().baseUrlImageDota)\(model.img)")!)
                    )
                    // MARK :- APPEND HERO MODELS
                    for role in model.roles {
                        self.tempHeroStatusString.append(role)
                    }
                }
                self.tempHeroStatusString.append("All")
            }, onError: { error in
                Loading.dismiss()
                self.vc.showAlert(title: "\(error)")
            }, onCompleted: {
                let result = self.tempHeroStatusString.removingDuplicates()
                self.relayHeroStatusModels.onNext(result)
                self.relayHeroModels.onNext(self.tempHeroModels)
                Loading.dismiss()
            }).disposed(by: self.dispose)
        } catch { }
    }
    
    func fetchHeroByRole(role: String) {
        self.tempHeroModels.removeAll()
        for result in self.tempHeroStatusResponse {
            if role == "All" {
                self.tempHeroModels.append(
                    HeroesModels(
                        id: result.id,
                        nameOfHero: result.localizedName,
                        imageOfHero: URL(string: "\(HTTPClient.init().baseUrlImageDota)\(result.img)")!)
                )
            } else {
                for finalResult in result.roles {
                    if finalResult == role {
                        self.tempHeroModels.append(
                            HeroesModels(
                                id: result.id,
                                nameOfHero: result.localizedName,
                                imageOfHero: URL(string: "\(HTTPClient.init().baseUrlImageDota)\(result.img)")!)
                        )
                    }
                }
            }
        }
        self.relayHeroModels.onNext(self.tempHeroModels)
    }
    
}
