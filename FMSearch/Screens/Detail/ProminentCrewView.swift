//
//  ProminentCrewView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/19/20.
//

import SwiftUI

struct ProminentCrewView: View {
    let job1: String
    let crew1: [Crew]?
    let job2: String?
    let crew2: Crew?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(job1): ")
                    .foregroundColor(.secondary)
                    .font(.headline)
                if let prom = crew1 {
                    Text(prom.map(\.name).joined(separator: ", "))
                        .fontWeight(.semibold)
                } else {
                    Text("N/A")
                        .fontWeight(.semibold)
                }
            }
            Spacer()
            if let title2 = job2 {
                VStack(alignment: .leading) {
                    Text("\(title2): ")
                        .foregroundColor(.secondary)
                        .font(.headline)
                    if let prom2 = crew2 {
                        Text(prom2.name)
                            .fontWeight(.semibold)
                    } else {
                        Text("N/A")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct ProminentCrewView_Previews: PreviewProvider {
    static var previews: some View {
        ProminentCrewView(job1: "Director",
                          crew1: [Crew(id: 2, creditId: "", job: "Director",
                                       name: "Christopher Nolan", department: "", profilePath: "")],
                          job2: "Cinematographer",
                          crew2: nil)
    }
}
