
import SwiftUI

enum CarouselItemShape: Equatable {
    case square
    case round
    case vRectangle(roundedCorners: Bool = true)
    case hRectangle(roundedCorners: Bool = true)
    
}

struct CarouselHeaderView: View {
    @State var title: String
    var movies = allMedia
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink(value: "", label: {
                Text("See all")
            })
            .navigationDestination(for: String.self) { str in
                GridView(movies: movies)
                    .toolbar(.hidden, for: .tabBar)
            }
        }
        .padding()
    }
}

struct CarouselView: View {
    var movies = allMedia
    
    @State var headerTitle: String?
    @State var shape: CarouselItemShape
    @State var visibleItemsCount: Int
    let rows = [GridItem()]
    
    var body: some View {
        
        if let hTitle = headerTitle, !hTitle.isEmpty {
            CarouselHeaderView(title: hTitle)
        }

        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0..<movies.count) { index in
                    let movie = movies[index]
                    NavigationLink {
                        LikedView(media: movie)
                            .toolbar(.hidden, for: .tabBar)
                        
                    } label: {
                        VStack(spacing: shape == .round ? 0 : 4) {
                            CarouselItem(movie: movie, shape: shape, itemWidth: (UIScreen.main.bounds.width/CGFloat(visibleItemsCount)))
                            Text(movie.title)
                                .font(.headline)
                                .foregroundStyle(.primary)
                                .foregroundColor(.primary)
                        }
                        .padding(EdgeInsets(top: 2, leading: 2, bottom: 12, trailing: 2))
                    }
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    CarouselView(movies: [Media(title: "Title", thumbnail: "img1"),
                                Media(title: "Title", thumbnail: "img2"),
                          Media(title: "Title", thumbnail: "img3"), Media(title: "Title", thumbnail: "img4"), Media(title: "Title", thumbnail: "img5")], headerTitle: "Title", shape: .round,visibleItemsCount: 3)
}

struct CarouselItem: View {
    
    var movie: Media
    var shape: CarouselItemShape
    var itemWidth: CGFloat
    
    var body: some View {
        
        if shape == .round {
            Image(movie.thumbnail ?? "")
                .resizable()
                .scaledToFill()
                .frame(height: itemWidth)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 2)
                }
                .shadow(radius: 7)
        } else {
            Image(movie.thumbnail ?? "")
                .resizable()
                .scaledToFill()
                .frame(height: itemWidth)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                .padding(.horizontal, 2)
        }
    }
}
