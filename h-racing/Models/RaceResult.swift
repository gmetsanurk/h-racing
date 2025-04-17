//
//  RaceResult.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
import Foundation
import RealmSwift

struct RaceResult {
    let date: Date
    let finishOrder: [Int]
}

class RealmRaceResult: Object {
    @Persisted var date: Date = Date()
    @Persisted var finishOrder = List<Int>()
    
    convenience init(date: Date, order: List<Int> = List<Int>()) {
        self.init()
        self.date = date
        self.finishOrder.append(objectsIn: order)
    }
}
