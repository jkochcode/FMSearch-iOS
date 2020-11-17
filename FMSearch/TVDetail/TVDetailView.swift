//
//  TVDetailView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/17/20.
//

import Combine
import SwiftUI

struct TVDetailView: View {
    var publisher: AnyPublisher<TVDetail, Error>

    var body: some View {
        AsyncContentView(source: publisher) { detail in
            Text(detail.name)
        }
    }
}

// struct TVDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVDetailView()
//    }
// }
