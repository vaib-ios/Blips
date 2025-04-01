
import SwiftUI

struct LikedView: View {
    
    let images = [
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
        "popcorn.fill",
    ]
    
    @State var media: Media
    
    var body: some View {
        NavigationStack {
                HStack {
                    Text(media.title)
                    Spacer()
                    Image(media.thumbnail)
                }
                .padding()
        }
        .navigationTitle("Liked")
    }
}

#Preview {
    LikedView(media: Media(title: "Title", thumbnail: "imgUrl"))
}
