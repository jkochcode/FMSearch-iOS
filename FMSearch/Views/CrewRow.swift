//
//  DepartmentView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/16/20.
//

import FetchImage
import SwiftUI

struct CrewRow: View {
    let crew: Crew

    var body: some View {
        HStack {
            if let profilePath = crew.profilePath {
                PosterImage(path: profilePath, small: true)
            } else {
                Image("placeholder")
                    .resizable()
                    .frame(width: 80, height: 120)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(crew.name)
                Text(crew.job)
            }
        }
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
