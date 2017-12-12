//
//  Mechanics.swift
//  Countdown-Timer
//
//  Created by Filip Grebowski on 09/12/2017.
//  Copyright © 2017 Filip Grebowski. All rights reserved.
//

import UIKit

class Mechanics: UIViewController {
    
    var timer = Timer()
    
    var timeHour = timePicker.GlobalVariable.extracted_hour
    var timeMinute = timePicker.GlobalVariable.extracted_minute
    var timeSecond = timePicker.GlobalVariable.extracted_second
    
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    
    @IBAction func timerStart() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Mechanics.processTimer), userInfo: nil, repeats: true)
    }

    @objc func processTimer() {
        if timeSecond > 0 {
            seconds?.text = String(timeSecond)
            timeSecond = timeSecond - 1
        }
        else if timeSecond == 0 {
            seconds?.text = "59"
            timeMinute = timeMinute - 1
            minutes?.text = String(timeMinute)
        }
        else {
            timer.invalidate()
        }
    }
    
    @IBAction func timerStop(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        timePicker.GlobalVariable.extracted_hour = 0
        timePicker.GlobalVariable.extracted_minute = 0
        timePicker.GlobalVariable.extracted_second = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hours?.text = String(timeHour)
        minutes?.text = String(timeMinute)
        seconds?.text = String(timeSecond)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
