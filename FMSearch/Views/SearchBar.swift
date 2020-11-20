//
//  SearchBar.swift
//  FMSearch
//
//  Created by Josh Koch on 11/8/20.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    @State private var isSearching = false

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(.leading, 24)

                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(.systemGray5))
                .cornerRadius(6)
                .padding(.horizontal)
                .onTapGesture {
                    isSearching = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()

                        if isSearching {
                            Button(
                                action: { searchText = "" },
                                label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                }
                            )
                        }
                    }
                    .padding(.horizontal, 32)
                    .foregroundColor(.gray)
                )
                .transition(.move(edge: .trailing))
                .animation(.spring())
            if isSearching {
                Button(
                    action: {
                        isSearching = false
                        UIApplication.shared.sendAction(
                            #selector(UIResponder.resignFirstResponder),
                            to: nil, from: nil, for: nil
                        )
                    },
                    label: {
                        Text("Cancel")
                            .padding(.trailing)
                            .padding(.leading, 0)
                    }
                )
                .transition(.move(edge: .trailing))
                .animation(.easeIn)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("Tenet"))
    }
}
