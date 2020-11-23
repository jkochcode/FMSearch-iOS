//
//  TVDetail.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct TVDetail: Identifiable {
    let id: Int
    let name: String
    let posterPath: String?
    let firstAirDate: Date?
    let overview: String?
    let createdBy: [Crew]?
    let crew: [Crew]?

    var departments: [String]? {
        crew?.compactMap(\.department).unique().sorted()
    }
}

extension TVDetail: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, name, posterPath, firstAirDate, overview, createdBy, credits
    }

    enum CreditsCodingKeys: String, CodingKey {
        case crew
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        firstAirDate = try container.decodeIfPresent(Date.self, forKey: .firstAirDate)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        createdBy = try container.decodeIfPresent([Crew].self, forKey: .createdBy)

        let credits = try container.nestedContainer(keyedBy: CreditsCodingKeys.self, forKey: .credits)
        crew = try credits.decode([Crew].self, forKey: .crew)
    }
}
