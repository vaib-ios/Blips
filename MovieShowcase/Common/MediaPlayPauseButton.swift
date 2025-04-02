
import SwiftUI

struct MediaPlayPauseButton: View {
    @State var image: Image
    @State private var didTap: Bool = false
    var body: some View {
        Button(action: {
            self.didTap.toggle()
        }) {
            (didTap ? Image(systemName: "pause.fill") : image)
                .padding()
                .frame(height: 30)
                .tint(.white)
                .scaleEffect(1.5)
                .padding()
        }
        .clipShape(Circle())
        .background(
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.4))
                    .scaleEffect(1.6)
                Circle()
                    .fill(Color.white.opacity(0.3))
                Circle()
                    .fill(Color.blue)
            }
        )
    }
}

#Preview {
    MediaPlayPauseButton(image: Image(systemName: "play.fill"))
}
