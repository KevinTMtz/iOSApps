//
//  ContentView.swift
//  Hacker News
//
//  Created by Kevin Torres on 27/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .fontWeight(.bold)
                        Divider()
                        Text(post.title)
                    }
                }            }
                .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hi"),
//    Post(id: "2", title: "Hello"),
//    Post(id: "3", title: "Hola")
//]
