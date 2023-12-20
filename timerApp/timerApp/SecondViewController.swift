//
//  SecondViewController.swift
//  timerApp
//
//  Created by РАХАТ  on 01.12.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
     
    var time = 0
    
    var timer = Timer()
    
    var startedTime = 0
    
    var isTimerRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = timeToString(intTime: time)
        
        startedTime = time
    }
    
    @objc func countTime(){
        time -= 1
        
        label.text = timeToString(intTime: time)
        
        if label.text == String(0){
            timer.invalidate()
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
        if isTimerRunning{
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        isTimerRunning = true

    }
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        time = startedTime
        isTimerRunning = false
        label.text = timeToString(intTime: time)
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    func timeToString(intTime: Int) -> String{
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
