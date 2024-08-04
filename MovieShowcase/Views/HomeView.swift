
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var imageUrl: String
}

struct HomeView: View {
    var movies = (1...15).compactMap {
        Movie(title: "Title", imageUrl: "img\($0)")
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                if let img = movies.randomElement()?.imageUrl {
                    BannerView(imageName:img, heightRatio: 0.6)
                }
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Trending")
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Upcoming")
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Movies")
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
