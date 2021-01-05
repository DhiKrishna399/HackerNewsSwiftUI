//
//  ContentView.swift
//  HackerNews_SwiftUI
//
//  Created by Dhiva Krishna on 1/2/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                
                //Use navlink to add the little cliclable arrow that transitions pages
                NavigationLink(destination: PostDetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4XOR NEWS")
        }
        
        .onAppear {
            self.networkManager.getData() 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
