//
//  CrewListView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/16/20.
//

import SwiftUI

struct CrewListView: View {
    let crew: [Crew]
    let department: String

    var body: some View {
        List(crew.filter { $0.department == department }, id: \.creditId) { person in
            CrewRow(crew: person)
        }
        .navigationTitle(department)
    }
}

struct CrewListView_Previews: PreviewProvider {
    static var previews: some View {
        CrewListView(crew: [], department: "Camera")
    }
}
