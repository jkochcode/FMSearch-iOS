//
//  TVDetail.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct TVDetail: Decodable {
    let id: Int
    let name: String
    let firstAirDate: String
    let overview: String?
    let createdBy: [Creator]?
    let crew: [Crew]
}

extension TVDetail {
    enum CodingKeys: String, CodingKey {
        case id, name, firstAirDate, overview, createdBy, credits
    }

    enum CreditsCodingKeys: String, CodingKey {
        case crew
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        firstAirDate = try container.decode(String.self, forKey: .firstAirDate)
        overview = try container.decode(String.self, forKey: .overview)
        createdBy = try container.decode([Creator].self, forKey: .createdBy)

        let credits = try container.nestedContainer(keyedBy: CreditsCodingKeys.self, forKey: .credits)
        crew = try credits.decode([Crew].self, forKey: .crew)
    }
}
