//
//  HomeView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/9/20.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    private let rowHeight: CGFloat = 192

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                AsyncContentView(source: viewModel) { trending in
                    Text("Trending Movies")
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            LazyHGrid(
                                rows: [
                                    GridItem(.fixed(rowHeight)),
                                    GridItem(.fixed(rowHeight))
                                ],
                                spacing: 8
                            ) {
                                ForEach(trending.movies) { movie in
                                    NavigationLink(
                                        destination: MovieDetailView(
                                            publisher: viewModel.loadMovie(
                                                id: movie.id))
                                    ) {
                                        PosterImage(path: movie.posterPath)
                                    }
                                }
                            }
                        }
                    }
                    Text("Trending TV Shows")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            LazyHGrid(
                                rows: [
                                    GridItem(.fixed(rowHeight)),
                                    GridItem(.fixed(rowHeight))
                                ],
                                spacing: 8
                            ) {
                                ForEach(trending.shows) { show in
                                    NavigationLink(
                                        destination: TVDetailView(
                                            publisher: viewModel.loadShow(
                                                id: show.id))
                                    ) {
                                        PosterImage(path: show.posterPath)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
