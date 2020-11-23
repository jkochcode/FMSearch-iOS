//
//  SearchRow.swift
//  FMSearch
//
//  Created by Josh Koch on 11/21/20.
//

import SwiftUI

struct SearchRow: View {
    let item: SearchResult

    var body: some View {
        HStack(spacing: 8) {
            PosterImage(path: item.posterPath, small: true)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                if let release = item.releaseDate {
                    Text(dayMonthFormatter.string(from: release))
                        .font(.subheadline)
                }
            }
        }
        .padding(.vertical)
    }
}

// struct SearchRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRow(item: SearchResult(i)
//    }
// }
