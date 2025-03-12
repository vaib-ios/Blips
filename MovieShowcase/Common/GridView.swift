//
//  GridView.swift
//  MovieShowcase
//
//  Created by Vaibhav Limbani on 13/03/25.
//

import SwiftUI

struct GridView: View {
    var movies = (1...15).compactMap {
        Movie(title: "Title", imageUrl: "img\($0)")
    }
    let columns = [GridItem(.adaptive(minimum: 150)), GridItem(.adaptive(minimum: 150))]
       
    let rows = [GridItem(.fixed(50)), GridItem(.fixed(50))]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(movies, id: \.self) { item in
                    Image(item.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(alignment: .center)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .padding(.horizontal, 6)
                }
            }
            .padding()
        }
        .navigationTitle("Movies")
    }
}

#Preview {
    GridView(movies: [Movie(title: "", imageUrl: "")])
}
