//
//  ImageView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import FetchImage
import SwiftUI

struct PosterImage: View {
    @ObservedObject var image: FetchImage
    var small: Bool = false

    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray)
            image.view?
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: small ? 80 : 128, height: small ? 120 : 192)
        .cornerRadius(4)

        // (Optional) Animate image appearance
        .animation(.default)

        // (Optional) Cancel and restart requests during scrolling
        .onAppear(perform: image.fetch)
        .onDisappear(perform: image.cancel)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(
            string:
            "https://image.tmdb.org/t/p/w500/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg"
        )!
        return PosterImage(image: FetchImage(url: url))
    }
}
