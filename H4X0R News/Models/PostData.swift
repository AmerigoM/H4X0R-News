//
//  PostData.swift
//  H4X0R News
//
//  Created by Amerigo Mancino on 13/10/2019.
//  Copyright © 2019 Amerigo Mancino. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    /* The Identifiable protocol needs a declaration of a property called "id", but
     * since I don't want to have two properties that works as an ID (id and objectID)
     * then I can use computed properties to return the objectID any time I will look
     * into the property id */
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String
}

