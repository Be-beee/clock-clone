//
//  StopWatchViewController.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/25.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var milisecLabel: UILabel!
    
    var timer = Timer()
    var df = DateFormatter()
    var startTime = 0.0
    var elapsed = 0.0
    var isStarting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonlayers()
    }
    
    func setButtonlayers(){
        cancelButton.clipsToBounds = true
        startButton.clipsToBounds = true
        cancelButton.layer.cornerRadius = 35
        startButton.layer.cornerRadius = 35
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        if isStarting {
            timer.invalidate()
            isStarting = false
        }

    }
    
    @IBAction func startTimer(_ sender: Any) {
        if !isStarting {
            startTime = Date().timeIntervalSince1970 - elapsed
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            isStarting = true
        }
    }
    
    @objc func updateTime() {
        elapsed = Date().timeIntervalSince1970 - startTime
        
        let date = Date(timeIntervalSince1970: elapsed)
        
        df.dateFormat = "mm"
        minuteLabel.text = df.string(from: date)
        
        df.dateFormat = "ss"
        secondLabel.text = df.string(from: date)
        
        df.dateFormat = "SS"
        milisecLabel.text = df.string(from: date)
    }
    
}
