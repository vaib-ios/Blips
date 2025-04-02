
import SwiftUI

struct FavouriteButton: View {
    @State var image: Image
    var body: some View {
        Button(action: {}) {
            image
                        .padding()
                        .frame(height: 30)
                        .tint(.white)
        }
        .clipShape(Circle())
        .background(
            Circle()
                .fill(Color.gray.opacity(0.5)))
                      }
}

#Preview {
    FavouriteButton(image: Image(systemName: "heart.fill"))
}
