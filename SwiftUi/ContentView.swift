import SwiftUI

struct ContentView: View {

    @ObservedObject var imageViewModel: ImageViewModel

    var body: some View {
        NavigationView {
            List(imageViewModel.imageModel) { model in
                NavigationLink(
                    destination: DetailView(url:model.downloadUrl ?? "" )
                ) {
                    VStack {
                        MyImageView(
                            url: model.downloadUrl ?? "",
                            isDetailView: false
                        )
                        Text(model.author ?? "").font(
                            .system(size: 20, weight: .bold, design: .rounded)
                        )
                    }
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
    var isDetailView: Bool
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .aspectRatio(contentMode: isDetailView ? .fill : .fit)
                .cornerRadius(isDetailView ? 0 : 20)
        } placeholder: {
            ProgressView()
        }
    }
}

struct DetailView: View {
    var url: String
    var body: some View {
        MyImageView(
            url: url,
            isDetailView: true
        ).ignoresSafeArea()
    }
}
