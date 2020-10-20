//
//  HeroCard.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 18/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

struct HeroCardViewModel {
    let id: Int
    let heroName: String
    let heroImage: String
}

class HeroCard : UIView, NibLoadableView {
    
    var viewModel : HeroCardViewModel?
    var didTapCard: ((Int) -> Void)?

    @IBOutlet weak var heroImage: HeroImage! 
    @IBOutlet weak var containerView: RoundShadowView!
    @IBOutlet weak var heroName: UILabel!
    
    func configure(viewModel : HeroCardViewModel) {
        self.viewModel = viewModel
        addGesture()
        heroName.text = viewModel.heroName
        heroImage.downloaded(from: viewModel.heroImage)
    }
    
    func addGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTappedCard))
        containerView.addGestureRecognizer(tap)
    }
    
    @objc func didTappedCard () {
        guard let id = viewModel?.id else {return}
        didTapCard?(id)
    }
}


