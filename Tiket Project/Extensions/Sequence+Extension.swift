//
//  Sequence+Extension.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

extension Sequence {
    func localizedStandardSorted<T: StringProtocol>(_ predicate: (Element) -> T, ascending: Bool = true) -> [Element] {
        sorted {
            predicate($0).localizedStandardCompare(predicate($1)) ==
                (ascending ? .orderedAscending : .orderedDescending)
        }
    }
}
