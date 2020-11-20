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
        NavigationView {
            ScrollView {
                HomeView()
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            VStack {
                                Button(
                                    action: { isPresented.toggle() },
                                    label: {
                                        Image(systemName: "magnifyingglass")
                                            .imageScale(.large)
                                    }
                                )
                                NavigationLink(
                                    destination: SearchView(
                                        viewModel: SearchViewModel()),
                                    isActive: $isPresented
                                ) { EmptyView() }
                            }
                        }
                    }
                Spacer()
                AcknowledgementText()
            }
            .navigationTitle("Home")
            .font(.system(.largeTitle, design: .rounded))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
