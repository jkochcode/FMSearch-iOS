//
//  ExpandableOverviewView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/19/20.
//

import SwiftUI

struct ExpandableOverviewView: View {
    @State private var revealDescription = false
    let overview: String?

    var body: some View {
        DisclosureGroup(
            "Overview", isExpanded: $revealDescription
        ) {
            if let overview = overview {
                Text(overview)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
        .foregroundColor(.secondary)
        .font(.headline)
    }
}

struct ExpandableOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableOverviewView(
            overview: "This is a long movie overview that is meant to WOW the reader into seeing the movie.")
    }
}
