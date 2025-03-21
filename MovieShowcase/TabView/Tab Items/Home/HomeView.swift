
import SwiftUI

struct Movie: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var imageUrl: String
}

struct HomeView: View {
    var movies = (1...15).compactMap {
        Movie(title: "Title", imageUrl: "img\($0)")
    }
    @State private var selectedMovie: Movie? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let img = movies.randomElement()?.imageUrl {
                    BannerView(imageName:img, heightRatio: 0.6)
                }
                HorizontalGridView(movies: movies.shuffled(), headerTitle: "Trending")
                HorizontalGridView(movies: movies.shuffled(), headerTitle: "Upcoming")
                HorizontalGridView(movies: movies.shuffled(), headerTitle: "Movies")
            }
            .ignoresSafeArea(edges: [.top, .leading, .trailing])
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}

struct RoundButton: View {
    @State var imageName: String
    @State var size: CGSize
    
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: imageName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.orange, lineWidth: 2))
        })
    }
}
