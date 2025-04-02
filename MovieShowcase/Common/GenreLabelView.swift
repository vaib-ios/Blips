
import SwiftUI

struct GenreLabelView: View {
    
    @State var value: String
    @State var image: Image?
    
    var body: some View {
        Label(title: {
            HStack {
                Text("8.7")
                    .font(.headline)
            }
        }, icon: {
            if let img = image {
                img
                    .resizable()
                    .scaledToFit()
                    .frame(height: 13)
                    .foregroundStyle(.yellow)
            }
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
    GenreLabelView(value: "8.4", image: Image(systemName: "star.fill"))
}
