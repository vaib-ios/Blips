
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
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Trending", itemTapped: {index, movie in
//                    selectedMovie = movie
                })
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Upcoming", itemTapped: {index, movie in
//                    selectedMovie = movie
                })
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Movies", itemTapped: {index, movie in
//                    selectedMovie = movie
                })
            }
            .ignoresSafeArea(edges: .top)
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
