
import SwiftUI

struct HomeView: View {
    var movies = allMedia
    var headers = ["Trending", "Upcoming", "Movies"]
    @State private var selectedMovie: Media? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let img = movies.randomElement()?.thumbnail {
                    BannerView(imageName:img, heightRatio: 0.6)
                }
                
                ForEach(headers, id: \.self) { header in
                    CarouselView(movies: movies.shuffled(), headerTitle: header, shape: .vRectangle(), visibleItemsCount: 2)
                }
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
