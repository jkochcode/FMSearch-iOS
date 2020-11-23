//
//  SearchViewModel.swift
//  FMSearch
//
//  Created by Josh Koch on 11/6/20.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([SearchResult])
    }

    @Published var query: String = ""
    @Published var selectedMedia: MediaType = .movie
    @Published private(set) var state = State.idle

    private let networkManager = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()

    func search() {
        if query != "" {
            state = .loading

            networkManager.loadSearch(for: query, in: selectedMedia)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] comp in
                    switch comp {
                    case let .failure(error):
                        self?.state = .failed(error)
                    case .finished:
                        break
                    }
                } receiveValue: { [weak self] results in
                    self?.state = .loaded(results)
                }
                .store(in: &cancellables)
        } else {
            state = .idle
        }
    }

    func loadMovie(id: Int) -> AnyPublisher<MovieDetail, Error> {
        networkManager.loadMovieDetail(for: id)
    }

    func loadShow(id: Int) -> AnyPublisher<TVDetail, Error> {
        networkManager.loadTVDetail(for: id)
    }
}
