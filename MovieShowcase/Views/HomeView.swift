
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var imageUrl: String
}

struct HomeView: View {
    
    let movies = [
        Movie(title: "Title", imageUrl: "popcorn.fill"),
        Movie(title: "Title", imageUrl: "popcorn.fill"),
        Movie(title: "Title", imageUrl: "popcorn.fill"),
        Movie(title: "Title", imageUrl: "popcorn.fill"),
        Movie(title: "Title", imageUrl: "popcorn.fill"),
        Movie(title: "Title", imageUrl: "popcorn.fill"),
        Movie(title: "Title", imageUrl: "popcorn.fill"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CarouselView(movies: movies, headerTitle: "Trending")
                
                CarouselView(movies: movies, headerTitle: "upcoming")
                
                CarouselView(movies: movies, headerTitle: "Movies")
            }
            .navigationTitle("Nav Title")
        }
    }
}

#Preview {
    HomeView()
}

