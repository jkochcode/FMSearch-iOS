//
//  Crew.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct Crew: Decodable {
    let id: Int
    let creditId: String
    let job: String
    let name: String
    let department: String
    let profilePath: String?
}
