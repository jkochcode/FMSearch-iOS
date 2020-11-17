//
//  Array+Ext.swift
//  FMSearch
//
//  Created by Josh Koch on 11/16/20.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
