//
//  TVDetailView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/17/20.
//

import Combine
import SwiftUI

struct TVDetailView: View {
    var publisher: AnyPublisher<TVDetail, Error>

    var body: some View {
        AsyncContentView(source: publisher) { detail in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    DetailTopView(path: detail.posterPath, title: detail.name, date: detail.firstAirDate)
                    ExpandableOverviewView(overview: detail.overview)
                    if let createdBy = detail.createdBy,
                       !createdBy.isEmpty {
                        ProminentCrewView(job1: "Creator", crew1: createdBy, job2: nil, crew2: nil)
                    }
                    DepartmentGrid(crew: detail.crew, departments: detail.departments)
                }
            }
            .padding(.horizontal)
            .navigationTitle(detail.name)
        }
    }
}

// struct TVDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVDetailView()
//    }
// }
