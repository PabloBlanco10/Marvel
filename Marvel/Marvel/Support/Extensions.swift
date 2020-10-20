//
//  Extensions.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 18/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension UIView {
    func makeCircleFromView() {self.layer.cornerRadius = self.bounds.size.width/2; clipsToBounds = true}
}

extension Error {
    func processHttpErrorResponse(with code: Int) -> String {
          let error: String
          switch code {
          case 400:
              error = "badRequest"
          case 401:
              error = "unauthorized"
          case 403:
              error = "forbidden"
          case 404:
              error = "notFound"
          case 500:
              error = "internalServerError"
          case 502:
              error = "badGateway"
          case 503:
              error = "unavailable"
          default:
              error = "unknown code : \(code)"
          }
          return error
      }
}
