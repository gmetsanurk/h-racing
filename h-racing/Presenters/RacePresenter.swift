//
//  RacePresenter.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
import Foundation
import UIKit

protocol RaceViewProtocol: AnyObject {
    func setStartButtonEnabled(_ enabled: Bool)
    func setResetButtonHidden(_ hidden: Bool)
    func resetHorses()
    func animateHorse(at index: Int, duration: TimeInterval, finishLineX: CGFloat, completion: @escaping () -> Void)
    func showFinishAlert(with finishOrder: [Int])
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

extension RacePresenter {
    func startRace() {
        raceFinishedCount = 0
        finishOrder = []
        
        view?.setStartButtonEnabled(false)
        view?.setResetButtonHidden(true)
        view?.resetHorses()
        
        let finishLineX = UIScreen.main.bounds.width - 70
        
        for index in 0..<horseCount {
            let duration = TimeInterval.random(in: 2.0...5.0)
            view?.animateHorse(at: index, duration: duration, finishLineX: finishLineX, completion: { [weak self] in
                self?.horseFinished(at: index)
            })
        }
    }
    
    func horseFinished(at index: Int) {
        raceFinishedCount += 1
        finishOrder.append(index + 1)
        if raceFinishedCount == horseCount {
            raceCompleted()
        }
    }
    
    func raceCompleted() {
        
    }
    
    func resetRace() {
        
    }
}
