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
    let date: Date?

    var body: some View {
        VStack(spacing: 4) {
            PosterImage(path: path)
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let date = date {
                VStack {
                    Text("Released:")
                        .foregroundColor(.secondary)
                    Text(dayMonthFormatter.string(from: date))
                }
            }
        }
    }
}

struct DetailTopView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTopView(path: nil, title: "Some Movie", date: Date())
    }
}
