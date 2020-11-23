//
//  SearchBar.swift
//  FMSearch
//
//  Created by Josh Koch on 11/8/20.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var selection: MediaType
    var load: () -> Void
    var media: [MediaType] = [.movie, .tv]
    @State private var isSearching = false

    var body: some View {
        VStack {
            TextField("Search...", text: $searchText, onCommit: { load() })
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
                    .foregroundColor(.gray)
                    .padding(.horizontal, 32)
                )
                .transition(.move(edge: .trailing))
                .animation(.spring())

            Picker(selection: $selection, label: Text(""), content: {
                ForEach(media, id: \.self) { media in
                    Text(media.rawValue)
                }
            })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("Tenet"), selection: .constant(.movie), load: {})
    }
}
