//
//  ImageView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import KingfisherSwiftUI
import SwiftUI

struct PosterImage: View {
    let path: String
    var small: Bool = false

    let baseUrl = "https://image.tmdb.org/t/p/w500/"

    var body: some View {
        KFImage(URL(string: baseUrl + path))
            .onFailure { err in
                print(err)
            }
            .placeholder {
                Image(systemName: "arrow.2.circlepath.circle")
                    .font(.largeTitle)
                    .opacity(0.3)
            }
            .resizable()
            .frame(width: small ? 80 : 128, height: small ? 120 : 192)
            .cornerRadius(4)
            .shadow(radius: 4)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        PosterImage(path: "ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg")
    }
}
