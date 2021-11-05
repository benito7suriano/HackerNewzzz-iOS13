//
//  NetworkManager.swift
//  Hacker Newzzz
//
//  Created by Beno Suriano on 5/Nov/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, res, err) in
                if err == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            print("Got results: \(results)")
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch  {
                            if let e = err {
                                print(e)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
