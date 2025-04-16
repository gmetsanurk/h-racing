//
//  Untitled.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
protocol RaceViewProtocol: AnyObject {
    
}

import UIKit

class RacePresenter {
    weak var view: RaceViewProtocol?
    var horseViews: [UIView] = []
    let horseCount = 5
    var raceFinishedCount = 0
    var finishOrder: [Int] = []
    
    init(view: RaceViewProtocol) {
        self.view = view
    }
}
