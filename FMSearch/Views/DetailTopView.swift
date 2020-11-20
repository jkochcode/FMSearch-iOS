//
//  DetailTopView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/19/20.
//

import SwiftUI

struct DetailTopView: View {
    let path: String?
    let title: String
    let date: String?
    var body: some View {
        VStack(spacing: 4) {
            PosterImage(path: path)
            Text(title)
                .font(.headline)
            if let date = date {
                Text(date)
                    .font(.caption)
            }
        }
    }
}

struct DetailTopView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTopView(path: nil, title: "Some Movie", date: "10-01-1996")
    }
}
