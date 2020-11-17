//
//  Show.swift
//  FMSearch
//
//  Created by Josh Koch on 11/17/20.
//

import Foundation

struct Creator: Decodable {
    let id: Int
    let creditId: String
    let name: String
    let profilePath: String?
}

struct Show: Decodable {
    let id: Int
    let name: String
    let firstAirDate: String
    let overview: String?
    let createdBy: Creator?
}
