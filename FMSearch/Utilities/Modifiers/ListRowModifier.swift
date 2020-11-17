//
//  ListRowModifier.swift
//  FMSearch
//
//  Created by Josh Koch on 11/16/20.
//

import Foundation
import SwiftUI

struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }
    }
}
