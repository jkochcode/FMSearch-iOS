//
//  SearchView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import FetchImage
import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    //  @Binding var isPresented: Bool

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
                            PosterImage(
                                image: FetchImage(
                                    url: URL(
                                        string:
                                        "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")"
                                    )!),
                                small: true
                            )
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
