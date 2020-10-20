//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

struct DetailCharacterViewModel  {
    let id: Int
    let heroName: String
    let heroImage: String
    let heroComics :  CharactersModel.Comics
}

class CharacterDetailViewController : BaseViewController, Bindable {
    
    var viewModel : CharacterDetailViewModel
    var comicNames = [String]()
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var heroImage: HeroImage!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var comicsTable: UITableView! {
        didSet {
            comicsTable.rowHeight = UITableView.automaticDimension
            comicsTable.estimatedRowHeight = 44
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    required init(viewModel : CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() { tableHeight.constant = comicsTable.contentSize.height }
    
    func bindViewModel() {
        viewModel.updateWith = { hero in
            self.removeLoading()
            self.update(hero)
        }
        
        viewModel.showError = { error in
            self.removeLoading()
            self.showAlert(with: error)
        }
    }
    
    func update(_ hero : DetailCharacterViewModel ) {
        heroName.text = hero.heroName
        heroImage.downloaded(from: hero.heroImage)
        hero.heroComics.items.forEach { comic in comicNames.append(comic.name) }
        comicsTable.reloadData()
    }
}


extension CharacterDetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = comicNames[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
