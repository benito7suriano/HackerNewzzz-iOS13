//
//  ContentView.swift
//  Hacker Newzzz
//
//  Created by Beno Suriano on 5/Nov/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url:post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
            }
            .navigationBarTitle("Hacker Newzzz")
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
