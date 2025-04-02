
import SwiftUI

struct FavouriteButton: View {
    @State var image: Image
    @State private var didTap: Bool = false
    var body: some View {
        Button(action: {
            self.didTap.toggle()
        }) {
            image
                .padding()
                .frame(height: 30)
                .tint(didTap ? .blue : .white)
                .scaleEffect(2.0)
                .padding()
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
