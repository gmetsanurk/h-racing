//
//  RaceManager.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//

class RaceHistoryManager {
    static let shared = RaceHistoryManager()
    private init() {}
    var results: [RaceResult] = []
    
    func addResult(_ result: RaceResult) {
        results.append(result)
    }
}
