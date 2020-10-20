//
//  Bindable.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation

protocol Bindable {
    associatedtype ContentViewModel: ViewModel

    var viewModel: ContentViewModel { get set }
    
    init(viewModel: ContentViewModel)

    func bindViewModel()
}
