//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation

final class CharacterDetailViewModel : ViewModel {
    typealias Model = CharactersModel
    typealias Item = DetailCharacterViewModel

    var updateWith: ((DetailCharacterViewModel) -> Void)?
    var showError: ((String) -> Void)?
    
    var model: CharactersModel?
    
    init(configuration : CharacterDetailConfiguration) { fetchCharacter(configuration.id) }
    
    func fetchCharacter(_ id : Int) {
        model = CharactersModel(endpoint: .character(id))
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
        guard let hero = characters.data.results.first else {return}
        let heroDetail = DetailCharacterViewModel(id: hero.id, heroName: hero.name, heroImage: hero.thumbnail.path + "." + hero.thumbnail.extension, heroComics: hero.comics)
        self.updateWith?(heroDetail)
    }
}
