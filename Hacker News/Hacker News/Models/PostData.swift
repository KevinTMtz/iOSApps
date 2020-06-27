//
//  PostData.swift
//  Hacker News
//
//  Created by Kevin Torres on 27/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
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
