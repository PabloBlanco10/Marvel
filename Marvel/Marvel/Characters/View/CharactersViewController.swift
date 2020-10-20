//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 17/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import UIKit

class CharactersViewController : BaseViewController, Bindable {
    typealias ContentViewModel = CharactersViewModel
    var viewModel: CharactersViewModel
        
    @IBOutlet weak var stack: UIStackView!
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    required init(viewModel : CharactersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marvel Heros"
        showLoading()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.updateWith = { heros in
            self.update(heros)
            self.removeLoading()
        }
        
        viewModel.showError = { error in
            self.removeLoading()
            self.showAlert(with: error)
            self.addRetryButton()
        }
    }
    
    func update(_ heros : [HeroCardViewModel] ) {
        heros.forEach{ heroViewModel in
            let card = HeroCard.instantiate()
            card.configure(viewModel: heroViewModel)
            card.didTapCard = { id in self.didTapCard(id) }
            stack.addArrangedSubview(card)
        }
    }
    
    func didTapCard(_ id : Int){ viewModel.didTapCard(id, sender: self) }
    
    func addRetryButton() {
        let retryButton = UIButton(frame: CGRect(x: 100, y: 120, width: 150, height: 100))
        retryButton.backgroundColor = .black
        retryButton.setTitle("Retry", for: .normal)
        retryButton.addTarget(self, action: #selector(retry), for: .touchUpInside)
        view.addSubview(retryButton)
    }
    
    @objc func retry(sender : UIButton) {
        showLoading()
        viewModel.fetchCharacters()
        sender.removeFromSuperview()
    }
}
