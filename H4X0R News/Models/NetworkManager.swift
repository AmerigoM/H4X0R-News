//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Amerigo Mancino on 13/10/2019.
//  Copyright © 2019 Amerigo Mancino. All rights reserved.
//

import Foundation

// The ObservableObject protocol allows this class to broadcast his variable to any interested parties
class NetworkManager: ObservableObject {
    
    @Published
    var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
