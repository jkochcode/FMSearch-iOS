//
//  MovieDetailView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Combine
import SwiftUI

struct MovieDetailView: View {
    var publisher: AnyPublisher<MovieDetail, Error>

    var body: some View {
        AsyncContentView(source: publisher) { detail in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    DetailTopView(path: detail.posterPath, title: detail.title, date: detail.releaseDate)

                    ExpandableOverviewView(overview: detail.overview)

                    ProminentCrewView(job1: "Director", crew1: detail.director,
                                      job2: "Cinematographer", crew2: detail.dop)

                    DepartmentGrid(crew: detail.crew, departments: detail.departments)
                }
            }
            .padding(.horizontal)
            .navigationTitle(detail.title)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(
            publisher: NetworkManager.shared.loadMovieDetail(for: 577_922))
    }
}
