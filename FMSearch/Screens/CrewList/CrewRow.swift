//
//  DepartmentView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/16/20.
//

import SwiftUI

struct CrewRow: View {
    let crew: Crew

    var body: some View {
        HStack {
            PosterImage(path: crew.profilePath, small: true)
            VStack(alignment: .leading, spacing: 4) {
                Text(crew.name)
                    .fontWeight(.semibold)
                Text(crew.job ?? "No job credited")
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
            }
        }
        .padding(.vertical, 8)
    }
}

struct DepartmentView_Previews: PreviewProvider {
    static var previews: some View {
        CrewRow(
            crew: Crew(
                id: 1, creditId: "", job: "Director", name: "Christopher Nolan",
                department: "Directing", profilePath: ""
            ))
    }
}
