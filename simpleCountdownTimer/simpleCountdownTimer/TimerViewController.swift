//
//  TimerViewController.swift
//  simpleCountdownTimer
//
//  Created by Jesse Ruiz on 7/31/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Outlets
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    // MARK: - Actions
    @IBAction func playPausePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        
    }
    
    // MARK: - Methods

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
