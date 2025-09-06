import SwiftUI

struct ContentView: View {
    
    @ObservedObject var imageViewModel: ImageViewModel
    
    var body: some View {
        NavigationView {
            List(imageViewModel.imageModel) { model in
                VStack {
                    MyImageView(url: model.downloadUrl ?? "")
                    Text(model.author ?? "").font(.system(size: 20, weight: .bold, design: .rounded))
                }
            }
            .onAppear(perform: imageViewModel.loadData)
            .navigationTitle("Home Screen")
        }
    }
}

#Preview {
    ContentView(imageViewModel: ImageViewModel())
}

struct MyImageView: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
        } placeholder: {
            ProgressView()
        }
    }
}
