//
//  ViewModel.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype Item
    associatedtype Model
    
    var updateWith : ((Item) -> Void)? { get }
    var showError : ((String) -> Void)? { get }
    
    var model: Model? { get }
    
    func observeResponse()
}
