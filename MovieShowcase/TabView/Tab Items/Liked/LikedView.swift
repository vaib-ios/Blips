//
//  LikedView.swift
//  MovieShowcase
//
//  Created by Pratik Parmar on 03/08/24.
//

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
    
    @State var movie: Movie
    
    var body: some View {
        NavigationStack {
                HStack {
                    Text(movie.title)
                    Spacer()
                    Image(movie.imageUrl)
                }
                .padding()
        }
        .navigationTitle("Liked")
    }
}

#Preview {
    LikedView(movie: Movie(title: "Title", imageUrl: "imgUrl"))
}
