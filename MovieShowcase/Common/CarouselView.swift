
import SwiftUI

struct CarouselHeaderView: View {
    @State var title: String
    var movies = (1...15).compactMap {
        Movie(title: "Title", imageUrl: "img\($0)")
    }
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
    var movies = (1...15).compactMap {
        Movie(title: "Title", imageUrl: "img\($0)")
    }
    @State var headerTitle: String
    let rows = [GridItem()]
    
    var body: some View {
        CarouselHeaderView(title: headerTitle)
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0..<movies.count, id: \.self) { index in
                    let movie = movies[index]
                    NavigationLink {
                        LikedView(movie: movie)
                            .toolbar(.hidden, for: .tabBar)
                        
                    } label: {
                        VStack {
                            Image(movie.imageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 170)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                                .padding(.horizontal, 2)
                            Text(movie.title)
                                .font(.headline)
                                .foregroundStyle(.primary)
                                .foregroundColor(.primary)
                        }.padding(EdgeInsets(top: 2, leading: 2, bottom: 12, trailing: 2))
                    }
                }
            }
            
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    CarouselView(movies: [Movie(title: "Title", imageUrl: "popcorn.fill"),
                                Movie(title: "Title", imageUrl: "popcorn.fill"),
                                Movie(title: "Title", imageUrl: "popcorn.fill")], headerTitle: "Title")
}
