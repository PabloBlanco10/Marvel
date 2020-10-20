//
//  CharactersViewModel.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 17/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

final class CharactersViewModel : ViewModel {
    typealias Model = CharactersModel
    typealias Item = [HeroCardViewModel]
    
    var updateWith: (([HeroCardViewModel]) -> Void)?
    var showError: ((String) -> Void)?
    
    var model: CharactersModel?

    init() { fetchCharacters() }
    
    func fetchCharacters() {
        model = CharactersModel(endpoint: .characters)
        observeResponse()
    }
    
    func observeResponse(){
        model?.response.valueChanged = { value in
            guard let characters = value else {return}
            self.prepareResponse(characters)
        }
        model?.serviceDidFail = { error in
            self.showError?(error)
        }
    }
    
    func prepareResponse(_ characters :  CharactersModel.Characters) {
        var heroCards = [HeroCardViewModel]()
        characters.data.results.forEach { result in
            heroCards.append(HeroCardViewModel(id: result.id, heroName: result.name, heroImage: result.thumbnail.path + "." + result.thumbnail.extension))
        }
        self.updateWith?(heroCards)
    }
    
    func didTapCard(_ id : Int, sender: UIViewController) {
        let nextRoute = CharacterDetailRouter(viewControllerFactory: CharacterDetailFactory())
        nextRoute.navigate(from: sender, arguments: CharacterDetailConfiguration(id: id), transition: .modal)
    }
}
