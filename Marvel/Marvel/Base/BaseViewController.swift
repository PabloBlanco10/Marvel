//
//  BaseViewController.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    lazy var spinnerView = UIView(frame: view.frame)
    
    func showLoading() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        spinnerView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinnerView.addSubview(spinner)
        view.addSubview(spinnerView)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func removeLoading(){ self.spinnerView.removeFromSuperview() }
    
    func showAlert(with message : String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
