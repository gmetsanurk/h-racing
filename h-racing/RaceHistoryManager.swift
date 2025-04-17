//
//  RaceHistoryManager.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//

import RealmSwift

class RaceHistoryManager {
    static let shared = RaceHistoryManager()
    private let realm: Realm
    
    private init() {
        realm = try! Realm()
    }
    var results: [RaceResult] = []
    
    func addResult(_ result: RaceResult) {
        results.append(result)
    }
}
