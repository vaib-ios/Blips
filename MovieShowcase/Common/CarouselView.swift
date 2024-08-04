//
//  CarouselView.swift
//  MovieShowcase
//
//  Created by Pratik Parmar on 04/08/24.
//

import SwiftUI

struct CarouselHeaderView: View {
    
    @State var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
            Text("See all")
        }
        .padding()
    }
}

struct CarouselView: View {
    
    @State var movies: [Movie]
    @State var headerTitle: String
    
    var body: some View {
        CarouselHeaderView(title: headerTitle)
        ScrollView(.horizontal) {
            HStack {
                ForEach(movies) { movie in
                    Image(systemName: movie.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 170)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

#Preview {
    CarouselView(movies: [Movie(title: "Title", imageUrl: "popcorn.fill"),
                          Movie(title: "Title", imageUrl: "popcorn.fill"),
                          Movie(title: "Title", imageUrl: "popcorn.fill")],
                 headerTitle: "Title")
}
