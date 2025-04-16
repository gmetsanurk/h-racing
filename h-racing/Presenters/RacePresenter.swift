//
//  RacePresenter.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
protocol RaceViewProtocol: AnyObject {
    
}

class RacePresenter {
    weak var view: RaceViewProtocol?
    let horseCount = 5
    var raceFinishedCount = 0
    var finishOrder: [Int] = []
    
    init(view: RaceViewProtocol) {
        self.view = view
    }
}
