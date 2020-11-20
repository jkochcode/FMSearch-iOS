//
//  DepartmentGrid.swift
//  FMSearch
//
//  Created by Josh Koch on 11/19/20.
//

import SwiftUI

struct DepartmentGrid: View {
    let crew: [Crew]?
    let departments: [String]?

    var body: some View {
        if let crew = crew,
           let departments = departments {
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 8
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
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .foregroundColor(.blue)
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    }
                }
            }
            .padding(4)
        }
    }
}

struct DepartmentGrid_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentGrid(crew: [], departments: [])
    }
}
