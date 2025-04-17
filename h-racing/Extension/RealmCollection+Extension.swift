//
//  RealmCollection+Extension.swift
//  h-racing
//
//  Created by Georgy on 2025-04-17.
//

import RealmSwift

extension RealmCollection {
    func toArray<T>() -> [T] {
        return self.compactMap{$0 as? T}
    }
}
