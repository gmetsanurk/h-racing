//
//  HistoryPresenter.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
protocol HistoryViewProtocol: AnyObject {
    func reloadData()
}

class HistoryPresenter {
    weak var view: HistoryViewProtocol?
    
    init(view: HistoryViewProtocol) {
        self.view = view
    }
    
    var results: [RaceResult] {
        return RaceHistoryManager.shared.results.reversed()
    }
    
    func numberOfResults() -> Int {
        return results.count
    }
    
    func result(at index: Int) -> RaceResult {
        return results[index]
    }
    
    func viewWillAppear() {
        view?.reloadData()
    }
}
