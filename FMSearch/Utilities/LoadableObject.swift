//
//  LoadableObject.swift
//  FMSearch
//
//  Created by Josh Koch on 11/6/20.
//

import Foundation

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
