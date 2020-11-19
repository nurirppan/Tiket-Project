//
//  HTTPAuth.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

class HTTPAuth {
    
    static let shared = HTTPAuth()
    
    private init() { }
    
    enum tokenType {
        case basic
        case bearer
    }
    
    var basic: String {
        return ""
    }
    
    var bearerToken: String? {
        
        return nil
    }
    
    var refreshToken: String? {
       
        return nil
    }
    
    var firebaseToken: String? {
        
        return nil
    }
    
    func removeAccessToken() {
    }
    
    func removeRefreshToken() {
    }
    
    func removeFirebaseToken() {
    }
    
    func saveBearer(token: String) {
    }
    
    func saveRefresh(token: String) {
    }
    
    func saveFirebase(token: String) {
    }
    

    
}
