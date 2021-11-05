//
//  PostData.swift
//  Hacker Newzzz
//
//  Created by Beno Suriano on 5/Nov/21.
//

import Foundation

struct Results: Decodable {
    let hits: [ Post ]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    var id: String {
        return objectID
    }
}
