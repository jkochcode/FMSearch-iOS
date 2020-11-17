//
//  MovieDetailView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Combine
import FetchImage
import SwiftUI

struct MovieDetailView: View {
    var publisher: AnyPublisher<MovieDetail, Error>

    @State private var revealDescription = false

    var body: some View {
        AsyncContentView(source: publisher) { detail in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    VStack(spacing: 4) {
                        PosterImage(path: detail.movie.posterPath ?? "")
                        Text(detail.movie.title)
                            .font(.headline)
                        if let date = detail.movie.releaseDate {
                            Text(date)
                                .font(.caption)
                        }
                    }
                    DisclosureGroup(
                        "Description", isExpanded: $revealDescription
                    ) {
                        if let overview = detail.movie.overview {
                            Text(overview)
                                .font(.body)
                        }
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Director: ")
                                .fontWeight(.light)
                            if let director = detail.director {
                                Text(director.name)
                            }
                            Spacer()
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Cinematographer: ")
                                .fontWeight(.light)
                            if let dop = detail.dop {
                                Text(dop.name)
                            }
                            Spacer()
                        }
                    }

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16
                    ) {
                        ForEach(detail.departments, id: \.self) { dep in
                            NavigationLink(
                                destination: CrewListView(
                                    crew: detail.crew, department: dep
                                )
                            ) {
                                Text(dep)
                                    .fontWeight(.bold)
                                    .accentColor(.primary)
                                    .frame(maxWidth: .infinity, minHeight: 80, maxHeight: .infinity)
                                    .border(Color.black, width: 2)
                                    .cornerRadius(4)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle(detail.movie.title)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(
            publisher: NetworkManager.shared.loadMovieDetail(for: 577_922))
    }
}
