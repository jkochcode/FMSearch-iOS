//
//  Credit.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct CreditDetail: Decodable {
    let id: Int
    let creditId: Int
    let department: String?
    let job: String?
}
