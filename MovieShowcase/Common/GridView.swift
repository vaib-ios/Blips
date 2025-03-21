
import SwiftUI

struct GridView: View {
    var movies = (1...15).compactMap {
        Movie(title: "Title", imageUrl: "img\($0)")
    }

    let columns = [GridItem(.adaptive(minimum: 100, maximum: 200)) , GridItem(.adaptive(minimum: 100, maximum: 200))]
       
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(movies, id: \.self) { item in
                                            
                    Image(item.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .padding(.horizontal, 6)
                }
            }
            .padding()
        }
        .navigationTitle("Movies")
    }
}

#Preview {
    GridView(movies: [Movie(title: "", imageUrl: "")])
}
