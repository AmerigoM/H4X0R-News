//
//  ContentView.swift
//  H4X0R News
//
//  Created by Amerigo Mancino on 13/10/2019.
//  Copyright © 2019 Amerigo Mancino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // adds a navigation view and the opportunity to go back
        NavigationView {
            // embed the elements in a table list
            List(posts) { post in
                Text(post.title)
            }
            .navigationBarTitle("H4X0R NEWS")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Hello in French"),
    Post(id: "3", title: "Hello in Italian"),
]
