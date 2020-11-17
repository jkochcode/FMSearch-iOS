//
//  MovieDetail.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct MovieDetail {
    let movie: Movie
    let crew: [Crew]
    let departments: [String]
    let director: Crew?
    let dop: Crew?
}
