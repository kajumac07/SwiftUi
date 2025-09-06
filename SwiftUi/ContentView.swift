//
//  ContentView.swift
//  SwiftUi
//
//  Created by Atul Tiwari on 06/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var imageViewModel: ImageViewModel
    var body: some View {
        
        NavigationView{
            VStack{
                MyImageView()
                Text("Hee Hee hey")
                 Text("Hee Hee hey")
            }.navigationTitle("Home Screen")
        }
        
       
    }
}

#Preview {
    ContentView(imageViewModel: ImageViewModel())
}

struct MyImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.mos.cms.futurecdn.net/hf2CQvHr9KNtKuUSDkeQVH.jpg")) { image in
            image
                .resizable()
                .scaledToFit().aspectRatio(contentMode: .fit).cornerRadius(20)
        } placeholder: {
            ProgressView()
        }
    }
}
