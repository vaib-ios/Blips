
import SwiftUI

struct BannerView: View {
    
    @State var imageName: String
    @State var heightRatio: Float
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: UIScreen.main.bounds.height * CGFloat(heightRatio))
            .mask(LinearGradient(gradient: Gradient(stops: [ .init(color: Color.black, location: 0), .init(color: Color.clear, location: 0.8) ]), startPoint: .center, endPoint: .bottom))
    }
}

#Preview {
    BannerView(imageName: "img1", heightRatio: 0.6)
}
