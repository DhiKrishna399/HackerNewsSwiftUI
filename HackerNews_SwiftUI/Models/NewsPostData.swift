//
//  NewsPostData.swift
//  HackNewsSwiftUI
//
//  Created by Dhiva Krishna on 1/2/21.
//

import Foundation

struct Results:Decodable {
    
    let hits: [Post]
    
}


struct Post: Decodable, Identifiable {
    
    //Identifiable requires us to have an id in order to identify each object
    var id: String {
        return objectID
    }
    let title: String
    let points: Int
    let url: String
    let objectID: String
}
