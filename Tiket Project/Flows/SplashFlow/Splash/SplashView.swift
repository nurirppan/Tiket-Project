//
//  SplashView.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

protocol SplashView: BaseView {
    var onCompleteTimer: (() -> Void)? { get set }
}
