
import SwiftUI

struct GridView: View {
    var movies: [Media] = allMedia

    let columns = [GridItem(.adaptive(minimum: 100, maximum: 200)), GridItem(.adaptive(minimum: 100, maximum: 200))]
       
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(movies) { item in
                                            
                    Image(item.thumbnail)
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
    GridView(movies: [Media(title: "", thumbnail: "")])
}
