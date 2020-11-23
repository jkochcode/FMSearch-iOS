//
//  PublishedObject.swift
//  FMSearch
//
//  Created by Josh Koch on 11/7/20.
//

import Combine
import Foundation

class PublishedObject<Wrapped: Publisher>: LoadableObject {
    @Published private(set) var state = LoadingState<Wrapped.Output>.idle

    private let publisher: Wrapped
    private var cancellable: AnyCancellable?

    init(publisher: Wrapped) {
        self.publisher = publisher
    }

    func load() {
        state = .loading

        cancellable =
            publisher
                .receive(on: DispatchQueue.main)
                .map(LoadingState.loaded)
                .catch { error in
                    Just(LoadingState.failed(error))
                }
                .sink { [weak self] state in
                    print(state)
                    self?.state = state
                }
    }
}
