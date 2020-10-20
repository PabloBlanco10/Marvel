//
//  CharactersModel.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 17/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import Alamofire

final class CharactersModel : Fetchable {

    var response = ObservableGeneric<Characters>()
    var serviceDidFail : ((String) -> Void )?

    init(endpoint : Endpoints) { performService(endpoint) }
    
    func performService(_ endpoint : Endpoints) {
        let url = URL(string: endpoint.url)!
        request(url).validate().responseJSON { [weak self] (response) in
            guard let self = self else {return}
            switch response.result {
            case .failure(let error):
                guard let statusCode = response.response?.statusCode else {
                    self.serviceDidFail?(error.localizedDescription)
                    return
                }
                self.serviceDidFail?(error.processHttpErrorResponse(with: statusCode))
            case .success( _):
                guard let data = response.data else { return }
                self.response.value =  try? JSONDecoder().decode(Characters.self, from: data)
            }
        }
    }
    
    // MARK: - Characters
      struct Characters : Codable {
          let code: Int
          let status, copyright, attributionText, attributionHTML: String
          let etag: String
          let data: DataClass
      }

      // MARK: - DataClass
      struct DataClass : Codable {
          let offset, limit, total, count: Int
          let results: [Result]
      }

      // MARK: - Result
      struct Result : Codable {
          let id: Int
          let name, description: String
          let modified: String
          let thumbnail: Thumbnail
          let resourceURI: String
          let comics, series: Comics
          let stories: Stories
          let events: Comics
          let urls: [URLElement]
      }

      // MARK: - Comics
      struct Comics : Codable {
          let available: Int
          let collectionURI: String
          let items: [ComicsItem]
          let returned: Int
      }

      // MARK: - ComicsItem
      struct ComicsItem : Codable {
          let resourceURI: String
          let name: String
      }

      // MARK: - Stories
      struct Stories : Codable {
          let available: Int
          let collectionURI: String
          let items: [StoriesItem]
          let returned: Int
      }

      // MARK: - StoriesItem
      struct StoriesItem : Codable {
          let resourceURI: String
          let name: String
          let type: String
      }

      // MARK: - Thumbnail
      struct Thumbnail : Codable {
          let path: String
          let `extension`: String
      }

      // MARK: - URLElement
      struct URLElement : Codable {
          let type: URLType
          let url: String
      }

      enum URLType : String, Codable {
          case comiclink
          case detail
          case wiki
      }
      
}
