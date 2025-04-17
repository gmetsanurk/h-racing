//
//  RaceHistoryManager.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
import Foundation
import RealmSwift

class RaceHistoryManager {
    static let shared = RaceHistoryManager()
    private let realm: Realm
    
    private init() {
        realm = try! Realm()
    }
    
    func addResult(date: Date, order: [Int]) {
        let obj = RealmRaceResult(date: date, order: List(order))
        try! realm.write {
            realm.add(obj)
        }
    }
}
