//
//  HistoryPresenter.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
import Foundation

protocol HistoryViewProtocol: AnyObject {
    func reloadData()
}

class HistoryPresenter {
    weak var view: HistoryViewProtocol?
    
    private var realmResults: [RealmRaceResult] = []
    
}
    
extension HistoryPresenter {
    
    func numberOfResults() -> Int {
        return realmResults.count
    }
    
    func result(at index: Int) -> (date: Date, order: [Int]) {
        let currentObject = realmResults[index]
        return (currentObject.date, currentObject.finishOrder.map{ $0 })
    }
    
    func viewWillAppear() {
        realmResults = RaceHistoryManager.shared.allResults()
        view?.reloadData()
    }
}
