//
//  Movie.swift
//  FMSearch
//
//  Created by Josh Koch on 11/16/20.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
}
