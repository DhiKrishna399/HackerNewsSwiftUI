//
//  PostDetailView.swift
//  HackerNews_SwiftUI
//
//  Created by Dhiva Krishna on 1/2/21.
//

import SwiftUI


struct PostDetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
 
    }
}



struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(url: "https://www.google.com")
    }
}



