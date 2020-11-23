//
//  SearchResult.swift
//  FMSearch
//
//  Created by Josh Koch on 11/21/20.
//

import Foundation

struct SearchResult: Decodable, Identifiable {
    let id: Int
    let media: MediaType
    let title: String
    let overview: String?
    let posterPath: String?
    let releaseDate: Date?

    enum MovieCodingKeys: String, CodingKey {
        case id, title, overview, posterPath, releaseDate
    }

    enum TVCodingKeys: String, CodingKey {
        case id
        case title = "name"
        case overview
        case posterPath
        case releaseDate = "firstAirDate"
    }

    init(from decoder: Decoder) throws {
        let movie = try decoder.container(keyedBy: MovieCodingKeys.self)

        if let title = try movie.decodeIfPresent(String.self, forKey: MovieCodingKeys.title) {
            id = try movie.decode(Int.self, forKey: .id)
            media = .movie
            self.title = title
            overview = try movie.decodeIfPresent(String.self, forKey: .overview)
            posterPath = try movie.decodeIfPresent(String.self, forKey: .posterPath)
            do {
                releaseDate = try movie.decodeIfPresent(Date.self, forKey: .releaseDate)
            } catch {
                releaseDate = nil
            }
        } else {
            let show = try decoder.container(keyedBy: TVCodingKeys.self)
            media = .tv
            id = try show.decode(Int.self, forKey: .id)
            title = try show.decode(String.self, forKey: .title)
            overview = try show.decodeIfPresent(String.self, forKey: .overview)
            posterPath = try show.decodeIfPresent(String.self, forKey: .posterPath)
            do {
                releaseDate = try show.decodeIfPresent(Date.self, forKey: .releaseDate)
            } catch {
                releaseDate = nil
            }
        }
    }
}
