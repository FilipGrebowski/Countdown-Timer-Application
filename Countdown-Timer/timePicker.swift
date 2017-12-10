//
//  timePicker.swift
//  Countdown-Timer
//
//  Created by Filip Grebowski on 09/12/2017.
//  Copyright © 2017 Filip Grebowski. All rights reserved.
//

import UIKit

class timePicker: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let hour = Array(0...23)
    let minute = Array(0...59)
    let second = Array(0...59)
    let separator = [":"]
    
    var recievedString: String = ""
    
    @IBOutlet weak var timepicker: UIPickerView!
    
    // Returns the number of columns in the picker view.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    // Returns the number of components in the appropriate columns.
    // In other words, it returns the number of strings in the array.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return hour.count
        }
        else if component == 1 {
            return 1
        }
        else if component == 2 {
            return minute.count
        }
        else if component == 3 {
            return 1
        }
        else {
            return second.count
        }
    }
    
    
    // Sets the current picker value to a label.
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        if component == 0 {
//            labelHour.text = String(hour[row])
//        }
//        else if component == 2 {
//            labelMinute.text = String(minute[row])
//        }
//        else if component == 4 {
//            labelSecond.text = String(second[row])
//        }
//    }
    
    // Sets all the specific attributes of UI picker view.
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = (view as? UILabel) ?? UILabel()
        
        pickerLabel.textColor = .white
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont(name: "AlexandriaFLF", size: 80)
        
        if component == 0 {
            pickerLabel.text = String(hour[row])
        }
        else if component == 1 {
            pickerLabel.text = ":"
        }
        else if component == 2 {
            pickerLabel.text = String(minute[row])
        }
        else if component == 3 {
            pickerLabel.text = ":"
        }
        else {
            pickerLabel.text = String(second[row])
        }
        
        return pickerLabel
    }
    
    // Sets the height of the UI picker rows.
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        if component == 0 {
            return 90.0
        }
        else if component == 1 {
            return 10.0
        }
        else if component == 2 {
            return 90.0
        }
        else if component == 3 {
            return 10.0
        }
        else {
            return 90.0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Upon loading the app, set the defualt value to 30 seconds.
        timepicker.selectRow(30, inComponent: 2, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
