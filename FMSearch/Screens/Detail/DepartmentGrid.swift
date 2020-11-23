//
//  DepartmentGrid.swift
//  FMSearch
//a
//  Created by Josh Koch on 11/19/20.
//

import SwiftUI

struct DepartmentGrid: View {
    let crew: [Crew]?
    let departments: [String]?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Crew Departments:")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            if let crew = crew,
               let departments = departments {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16
                ) {
                    ForEach(departments, id: \.self) { dep in
                        NavigationLink(
                            destination: CrewListView(
                                crew: crew, department: dep
                            )
                        ) {
                            Text(dep)
                                .fontWeight(.bold)
                                .accentColor(.primary)
                                .frame(maxWidth: .infinity, minHeight: 75)
                                .background(Color(.systemTeal))
                                .cornerRadius(8)
                        }
                        .buttonStyle(ImageButtonStyle())
                        .padding(.horizontal, 4)
                    }
                }
            } else {
                Text("No crew credited")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct DepartmentGrid_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentGrid(crew: [], departments: [])
    }
}
