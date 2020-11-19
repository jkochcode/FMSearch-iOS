//
//  SearchView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.query)
                .padding()

            AsyncContentView(source: viewModel) { movies in
                List(movies) { movie in
                    NavigationLink(
                        destination: MovieDetailView(
                            publisher: viewModel.loadMovie(id: movie.id))
                    ) {
                        HStack {
                            PosterImage(path: movie.posterPath, small: true)
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .font(.headline)
                                if let release = movie.releaseDate {
                                    Text(release)
                                        .font(.subheadline)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            Spacer()
            AcknowledgementText()
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView(viewModel: SearchViewModel())
        }
    }
}
