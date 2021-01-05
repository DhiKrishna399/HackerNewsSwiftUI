//
//  NetworkManager.swift
//  HackNewsSwiftUI
//
//  Created by Dhiva Krishna on 1/1/21.
//

import Foundation

//Allows it to prodcast its properties to other classes
class NetworkManager: ObservableObject {
    
    //Observer Design Pattern feeds off of this
    @Published var posts = [Post]()
    
    func getData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    //data is an optional so unrap it
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
