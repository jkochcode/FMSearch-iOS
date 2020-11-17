//
//  AcknowledgementText.swift
//  FMSearch
//
//  Created by Josh Koch on 11/9/20.
//

import SwiftUI

struct AcknowledgementText: View {
    var body: some View {
        Text("Powered by The Movie DB @ themoviedb.org")
            .font(.caption)
            .fontWeight(.light)
    }
}

struct AcknowledgementText_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementText()
    }
}
