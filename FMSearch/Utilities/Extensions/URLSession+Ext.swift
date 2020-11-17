//
//  URLSession+Ext.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import Combine
import Foundation

struct NetworkResponse<Wrapped: Decodable>: Decodable {
    var results: Wrapped
}

extension URLSession {
    func resultsPublisher<T: Decodable>(
        for url: URL,
        responseType _: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, Error> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: NetworkResponse<T>.self, decoder: decoder)
            .map(\.results)
            .eraseToAnyPublisher()
    }

    func publisher<T: Decodable>(
        for url: URL,
        responseType _: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, Error> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
