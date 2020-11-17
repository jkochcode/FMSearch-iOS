//
//  HomeViewModel.swift
//  FMSearch
//
//  Created by Josh Koch on 11/9/20.
//

import Combine
import Foundation

class HomeViewModel: LoadableObject {
    @Published private(set) var state = LoadingState<Trending>.idle

    private let networkManager = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()

    func load() {
        state = .loading

        networkManager.loadTrending()
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
    }

    func loadMovie(id: Int) -> AnyPublisher<MovieDetail, Error> {
        networkManager.loadMovieDetail(for: id)
    }

    func loadShow(id: Int) -> AnyPublisher<TVDetail, Error> {
        networkManager.loadTVDetail(for: id)
    }
}
