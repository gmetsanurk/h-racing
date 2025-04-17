//
//  List+Extension.swift
//  h-racing
//
//  Created by Georgy on 2025-04-17.
//
import RealmSwift
extension List {
    convenience init(_ values: [Element]) {
        self.init()
        self.append(objectsIn: values)
    }
}
