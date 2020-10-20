//
//  Network.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 17/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation

class ObservableGeneric<T> {
    var value: T? {didSet {DispatchQueue.main.async {self.valueChanged?(self.value ?? nil)}}}
    var valueChanged: ((T?) -> Void)?
}

protocol Fetchable {
    func performService(_ endpoint : Endpoints)
}

enum Endpoints {
    case characters
    case character(Int)
    case test
    
    private var host: String { return "https://gateway.marvel.com" }
    private var apiKey: String { return "&apikey=04d00f8231315bb9e95f87985fd3b9e8" }
    private var hash : String { return "&hash=99874f435ed16542b858004a0228e052" }
    private var ts : String { return "ts=1" }

    private var path: String {
        switch self {
        case .characters, .character:
            return "/v1/public/characters"
        case .test: return ""
        }
    }
    
    private var queryItems: String {
        switch self {
        case .character(let characterId): return "/\(characterId)?"
        case .characters: return "?limit=50&"
        case .test: return ""
        }
    }
    
    var url: String {
        return host + path + queryItems + ts + apiKey + hash
    }
}



