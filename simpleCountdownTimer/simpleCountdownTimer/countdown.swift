//
//  countdown.swift
//  simpleCountdownTimer
//
//  Created by Jesse Ruiz on 8/10/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

protocol CountdownDelegate: AnyObject {
    func countdownDidUpdate(timeRemaining: TimeInterval)
    func countdownDidFinish()
}

/// Enum to track the state of the countdown
enum CountdownState {
    /// Countdown is active and counting down
    case started
    
    /// Countdown has reached 0 and is not active
    case finished
    
    /// Countdown is at initial time value and is not active
    case reset
}

class Countdown {
    
    // MARK: - Properties
    
    /// Used to inform the delegate of the countdown's current state and when the countdown has finished
    weak var delegate: CountdownDelegate?
    
    /// Has a value only when the countdown is active. Waits a specific period and fires a method on a recurring interval
    private var timer: Timer?
    
    /// The current state of the countdown
    private(set) var state: CountdownState
    
    /// The number of seconds; the countdown's starting value
    var duration: TimeInterval
    
    /// Has a value only when countdown is active. Future date; determines when the timer should stop
    private var stopDate: Date?
    
    /// The derived number of seconds remaining when the countdown is active
    var timeRemaining: TimeInterval {
        if let stopDate = stopDate {
            let timeremaining = stopDate.timeIntervalSinceNow
            return timeremaining
        } else {
            return 0
        }
    }
    
    init() {
        timer = nil
        stopDate = nil
        duration = 0
        state = .reset
    }
    
    // MARK: - Methods
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func start() {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.03,
                                     repeats: true,
                                     block: updateTimer(timer:))
        stopDate = Date(timeIntervalSinceNow: duration)
        state = .started
    }
    
    private func updateTimer(timer: Timer) {
        if let stopDate = stopDate {
            let currentTime = Date()
            if currentTime <= stopDate {
                delegate?.countdownDidUpdate(timeRemaining: timeRemaining)
            } else {
                state = .finished
                cancelTimer()
                self.stopDate = nil
                delegate?.countdownDidFinish()
            }
        }
    }
    
    func reset() {
        stopDate = nil
        cancelTimer()
        state = .reset
    }
}
