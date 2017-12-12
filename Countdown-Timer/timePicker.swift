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
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var acceptButtonOrange: UIButton!
    
    struct GlobalVariable {
        static var extracted_hour = Int()
        static var extracted_minute = Int()
        static var extracted_second = Int()
    }

    // Resets the timepicker hour, minute and second values to 0.
    @IBAction func reset(_ sender: Any) {
        timepicker.selectRow(0, inComponent: 0, animated: true)
        timepicker.selectRow(0, inComponent: 2, animated: true)
        timepicker.selectRow(0, inComponent: 4, animated: true)
    }
    
    // Confirms the time and moves on to second view, unless user has not
    // selected a time. In that case an alert message pops up.
    @IBAction func accept(_ sender: Any) {
        if GlobalVariable.extracted_hour == 0 && GlobalVariable.extracted_minute == 0 && GlobalVariable.extracted_second == 0 {
            
            let alertController = UIAlertController(title: "Unable to Proceed", message:
                "Please select a time", preferredStyle: UIAlertControllerStyle.actionSheet)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch component {
            case 0:
                GlobalVariable.extracted_hour = Int(hour[row])
                break

            case 2:
                GlobalVariable.extracted_minute = Int(minute[row])
                break

            default:
                GlobalVariable.extracted_second = Int(second[row])
        }
    }
    
    // Sets all the specific attributes of UI picker view.
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = (view as? UILabel) ?? UILabel()
        
        pickerLabel.textColor = .white
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont(name: "AlexandriaFLF", size: 80)
        
        switch component {
            case 0:
                pickerLabel.text = String(hour[row])
                break
            
            case 1:
                pickerLabel.text = ":"
                break
            
            case 2:
                pickerLabel.text = String(minute[row])
                break
            
            case 3:
                pickerLabel.text = ":"
                break
            
            default:
                pickerLabel.text = String(second[row])
        }
        
        return pickerLabel
    }
    
    // Sets the height of the UI picker rows.
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 80
    }
    
    // Sets the width for each column.
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
        timepicker.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.timepicker.alpha = 1
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
