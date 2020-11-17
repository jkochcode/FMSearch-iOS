//
//  TVDetail.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct TVDetail: Decodable {
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String?
    let releaseDate: Date?
}
