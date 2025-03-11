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
    
    var body: some View {
        NavigationStack {
            List(images, id: \.self) { name in
                HStack {
                    Text("Object Name")
                    Spacer()
                    Image(systemName: name)
                }
                .padding()
            }
        }
        .navigationTitle("Liked")
    }
}

#Preview {
    LikedView()
}
