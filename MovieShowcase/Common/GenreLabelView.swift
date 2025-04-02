
import SwiftUI

struct GenreLabelView: View {
    var body: some View {
        Label(title: {
            HStack {
                Text("8.7")
                    .font(.headline)
            }
        }, icon: {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 13)
                .foregroundStyle(.yellow)
        })
        .foregroundStyle(.white)
        .padding([.leading, .trailing], 8)
        .clipShape(RoundedRectangle(cornerRadius: 4.0))
        .background(
            RoundedRectangle(cornerRadius: 4.0)
                .fill(Color.gray.opacity(0.5))
                .overlay(
                    RoundedRectangle(cornerRadius: 4.0)
                        .stroke(Color.gray.opacity(0.5))))
    }
}

#Preview {
    GenreLabelView()
}
