//
//  ImageButtonStyle.swift
//  FMSearch
//
//  Created by Josh Koch on 11/21/20.
//

import Foundation
import SwiftUI

struct ImageButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
