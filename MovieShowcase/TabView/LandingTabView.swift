//
//  TabView.swift
//  MovieShowcase
//
//  Created by Pratik Parmar on 03/08/24.
//

import SwiftUI

struct LandingTabView: View {
    var body: some View {
        
        TabView {
            NavigationStack {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(1)
                
                LikedView()
                    .tabItem {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("Liked")
                    }.tag(2)
                
                MoviesView()
                    .tabItem {
                        Image(systemName: "movieclapper.fill")
                        Text("Movies")
                    }.tag(3)
                
                SeriesView()
                    .tabItem {
                        Image(systemName: "movieclapper.fill")
                        Text("Series")
                    }.tag(4)
            }
        }
        
    }
}

#Preview {
    LandingTabView()
}
