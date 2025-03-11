
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
        NavigationView {
            ScrollView {
                
                if let img = movies.randomElement()?.imageUrl {
                    BannerView(imageName:img, heightRatio: 0.6)
                }
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Trending", itemTapped: {index, movie in
                    NavigationLink("", destination: LikedView())
                })
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Upcoming", itemTapped: {index, movie in
                    
                })
                
                CarouselView(movies: movies.shuffled(), headerTitle: "Movies", itemTapped: {index, movie in
                    
                })
            }
            .ignoresSafeArea(edges: .top)
            //        .navigationDestination(for: String.self, destination: { str in
            //            LikedView()
            //        })
            //        .toolbar(content: {
            //            ToolbarItem(placement: .topBarLeading) {
            //                RoundButton(imageName: "person.fill", size: CGSize(width: 30, height: 30))
            //            }
            //
            //            ToolbarItem(placement: .topBarTrailing) {
            //                RoundButton(imageName: "magnifyingglass.circle.fill", size: CGSize(width: 30, height: 30))
            //            }
            //        })
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
