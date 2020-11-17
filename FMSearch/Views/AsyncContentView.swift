//
//  AsyncContentView.swift
//  FMSearch
//
//  Created by Josh Koch on 11/6/20.
//
import Combine
import SwiftUI

struct AsyncContentView<
    Source: LoadableObject,
    LoadingView: View,
    Content: View
>: View {
    @ObservedObject var source: Source
    var loadingView: LoadingView
    var content: (Source.Output) -> Content

    init(
        source: Source,
        loadingView: LoadingView,
        @ViewBuilder content: @escaping (Source.Output) -> Content
    ) {
        self.source = source
        self.loadingView = loadingView
        self.content = content
    }

    var body: some View {
        switch source.state {
        case .idle, .loading:
            loadingView.onAppear(perform: source.load)
        case let .failed(error):
            Text(error.localizedDescription).lineLimit(nil)
        case let .loaded(output):
            content(output)
        }
    }
}

typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>

extension AsyncContentView where LoadingView == DefaultProgressView {
    init<P: Publisher>(
        source: P,
        @ViewBuilder content: @escaping (P.Output) -> Content
    ) where Source == PublishedObject<P> {
        self.init(
            source: PublishedObject(publisher: source),
            loadingView: ProgressView(),
            content: content
        )
    }
}

extension AsyncContentView where LoadingView == DefaultProgressView {
    init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content
    ) {
        self.init(
            source: source,
            loadingView: ProgressView(),
            content: content
        )
    }
}
