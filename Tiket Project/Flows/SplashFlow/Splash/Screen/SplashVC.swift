//
//  SplashVC.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import RxCocoa
import RxSwift

class SplashVC: UIViewController, SplashView {
    
    var onCompleteTimer: (() -> Void)?
    
    private let countDown = 1
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTimer()
    }
    
    private func setTimer() {
        Observable<Int>.timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)
            .take(countDown + 1)
            .subscribe(onNext: { timePassed in
                _ = self.countDown - timePassed
            }, onCompleted: {
                self.onCompleteTimer?()
            }).disposed(by: self.disposeBag)
        
    }
    
}
