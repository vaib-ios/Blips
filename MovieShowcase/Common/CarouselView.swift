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
    var itemTapped: (Int, Movie) -> Void
    
    var body: some View {
        CarouselHeaderView(title: headerTitle)
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<movies.count, id: \.self) { index in
                    let movie = movies[index]
                    Image(movie.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 170)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .padding(.horizontal, 2)
                        .onTapGesture {
                            itemTapped(index, movie)
                        }
                }
            }
        }
    }
}

#Preview {
    CarouselView(movies: [Movie(title: "Title", imageUrl: "popcorn.fill"),
                          Movie(title: "Title", imageUrl: "popcorn.fill"),
                          Movie(title: "Title", imageUrl: "popcorn.fill")],
                 headerTitle: "Title", itemTapped: {_,_ in })
}
