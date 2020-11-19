//
//  HTTPClient.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

class HTTPClient {
    #if DEBUG
    var baseUrl = URL(string: "https://jsonplaceholder.typicode.com")!
    #else
    var baseUrl = URL(string: "")!
    #endif
    
    #if DEBUG
    var baseUrlDota = URL(string: "https://api.opendota.com/api")!
    #else
    var baseUrlDota = URL(string: "")!
    #endif
    
    #if DEBUG
    var baseUrlImageDota = URL(string: "https://api.opendota.com")!
    #else
    var baseUrlImageDota = URL(string: "https://api.opendota.com")!
    #endif
}




