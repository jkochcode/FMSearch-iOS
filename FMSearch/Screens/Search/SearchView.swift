//
//  SearchView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $viewModel.query, selection: $viewModel.selectedMedia, load: viewModel.search)
                    .padding()
                Spacer()
                switch viewModel.state {
                case .idle:
                    Text("Search for a movie or show above")
                        .transition(.move(edge: .trailing))
                        .animation(.easeOut)
                case .loading:
                    ProgressView()
                        .transition(.opacity)
                        .animation(.easeOut)
                case .failed:
                    Text("There was an error loading the search results")
                        .transition(.move(edge: .trailing))
                        .animation(.easeOut)
                case let .loaded(results):
                    if results.isEmpty {
                        Text("There were no results for this search")
                            .transition(.move(edge: .trailing))
                            .animation(.easeOut)
                    } else {
                    List(results) { item in
                        switch item.media {
                        case .movie:
                            NavigationLink(
                                destination: MovieDetailView(
                                    publisher: viewModel.loadMovie(id: item.id))
                            ) {
                                SearchRow(item: item)
                            }
                        case .tv:
                            NavigationLink(
                                destination: TVDetailView(
                                    publisher: viewModel.loadShow(id: item.id))
                            ) {
                                SearchRow(item: item)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .transition(.move(edge: .trailing))
                    .animation(.easeOut)
                }
                }
                Spacer()
                AcknowledgementText()
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView()
        }
    }
}
