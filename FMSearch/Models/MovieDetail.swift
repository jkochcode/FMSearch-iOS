//
//  MovieDetail.swift
//  FMSearch
//
//  Created by Josh Koch on 11/15/20.
//

import Foundation

struct MovieDetail: Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String?
    let releaseDate: Date?
    let crew: [Crew]?

    var departments: [String]? {
        crew?.compactMap(\.department).unique().sorted()
    }

    var director: [Crew]? {
        crew?.filter { $0.job == "Director" }
    }

    var dop: Crew? {
        crew?.first(where: {
            $0.job == "Director of Photography"
        })
    }
}

extension MovieDetail: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, overview, posterPath, releaseDate, credits
    }

    enum CreditsCodingKeys: String, CodingKey {
        case crew
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        do {
            releaseDate = try container.decodeIfPresent(Date.self, forKey: .releaseDate)
        } catch {
            releaseDate = nil
        }

        let credits = try container.nestedContainer(keyedBy: CreditsCodingKeys.self, forKey: .credits)
        crew = try credits.decodeIfPresent([Crew].self, forKey: .crew)
    }
}
