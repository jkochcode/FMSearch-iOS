//
//  ContentView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/6/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
