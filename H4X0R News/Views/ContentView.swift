//
//  ContentView.swift
//  H4X0R News
//
//  Created by Amerigo Mancino on 13/10/2019.
//  Copyright © 2019 Amerigo Mancino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var networkManager = NetworkManager()
    
    var body: some View {
        // adds a navigation view and the opportunity to go back
        NavigationView {
            // embed the elements in a table list
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url) ) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            // the onAppear works like a viewDidLoad
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
