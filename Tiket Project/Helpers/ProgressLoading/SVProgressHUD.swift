//
//  SVProgressHUD.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//
import Foundation
import RxCocoa
import SVProgressHUD

enum Loading {
    
    static func defaultShow() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.black)
        }
    }
    
    static func dismiss() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
}
