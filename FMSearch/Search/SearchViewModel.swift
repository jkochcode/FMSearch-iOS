//
//  SearchViewModel.swift
//  FMSearch
//
//  Created by Josh Koch on 11/6/20.
//

import Combine
import Foundation

class SearchViewModel: LoadableObject {
    @Published var query: String = ""
    @Published private(set) var state = LoadingState<[SearchResult]>.idle

    private let networkManager = NetworkManager.shared

    private var cancellables = Set<AnyCancellable>()

    init() {
        $query
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in self?.load() })
            .store(in: &cancellables)
    }

    func load() {
        state = .loading

        networkManager.loadSearch(for: query, in: .movie)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] comp in
                switch comp {
                case let .failure(error):
                    if self?.query != "" {
                        print(error)
                        self?.state = .failed(error)
                    } else {
                        self?.state = .idle
                    }
                case .finished:
                    break
                }
            } receiveValue: { [weak self] results in
                self?.state = .loaded(results)
            }
            .store(in: &cancellables)
    }

    func loadMovie(id: Int) -> AnyPublisher<MovieDetail, Error> {
        networkManager.loadMovieDetail(for: id)
    }
}
